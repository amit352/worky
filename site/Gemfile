source :rubygems

gem 'colored'
gem 'racksh'

gem 'guard'
gem 'guard-rake'

gem 'coffee-script'
gem 'rake-pipeline',
  git: 'git://github.com/livingsocial/rake-pipeline',
  require: [
    'rake-pipeline',
    'rake-pipeline/middleware'
  ]
gem 'rake-pipeline-web-filters', git: 'git://github.com/wycats/rake-pipeline-web-filters'
gem 'rake'
gem 'rack-rewrite'
gem 'rack'

gem 'sass'
gem 'compass'
gem 'bootstrap-sass'

group :production do
  gem 'uglifier'
  gem 'yui-compressor'
end

group :development, :test do
  gem 'rspec'
end