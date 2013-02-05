require 'json'
require 'rake-pipeline-web-filters'
require 'compass'

class RewriteCoffeeRequireFilter < Rake::Pipeline::Filter
  def generate_output(inputs, output)
    inputs.each do |input|
      result = input.read
      result.gsub!(/require\ /, 'window.minispade.require ')
      puts "Here"
      output.write(result)
    end
  end
end

class RequireRewriteFilter < Rake::Pipeline::Filter
  def generate_output(inputs, output)
    inputs.each do |input|
      code = input.read
      resolve_relative_references(code, input.path)
      output.write code
    end
  end

  def resolve_relative_references(code, filepath)
    this_dir = File.dirname(filepath)
    this_dir = (this_dir == '.')? "": "#{this_dir}/"
    code.gsub!(/^\s*(require|requireAll)\s*\(\s*[\'\"]([^\'\"]*)[\'\"]\s*\)\s*/) do |req|
      path =  $2[0] == '.'? "#{this_dir}#{$2}": $2
      path = File.expand_path(path).sub("#{Dir.pwd}/", '')
      path.gsub!(%r{/index$|^coffeescript/|^packages/|^javascript/}, '')
      "require('#{path}')"
    end
    code
  end

  def self.module_id(filename)
    filename.gsub(%r#(^coffeescript/|^javascript[s]*/|^packages/|\.js|\.handlebars|/index\..+)#, '')
  end
end

module GemHelpers
  def self.gem_path(gem)
    Gem.loaded_specs[gem].full_gem_path
  end

  def self.sass_load_paths(*gems)
    gems.collect do |gem|
      if gem == 'compass'
        "#{gem_path(gem)}/frameworks/compass/stylesheets"
      else
        "#{gem_path(gem)}/vendor/assets/stylesheets"
      end
    end
  end
end

def load_gem_assets(output_dir, *gems)
  tmpdir = 'tmp/rakep-gem-assets'
  output tmpdir

  gems.each do |gem|
    assets_path = "#{GemHelpers.gem_path(gem)}/vendor/assets"
    input assets_path do
      match "**/javascript*/**/*.js" do
        minispade string: true, rewrite_requires: true, module_id_generator: ->(input){
          "#{gem}/#{RequireRewriteFilter.module_id(input.path)}"
        }
        concat "javascript/#{gem}.js"
      end

      match "images/*" do
        concat
      end
    end
  end

  output output_dir

  input tmpdir do
    match "javascript/*.js" do
      concat "javascript/gem-dependencies.js"
    end

    match "images/*" do
      concat
    end
  end
end
