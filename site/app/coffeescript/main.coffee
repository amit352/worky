# loading required libs
###
  If you want to include a new javascript library to your application
  create a folder in vendor/javascripts directory and add your file.
  For example in my case I created a folder named "ember" and added ember-1.0.pre.js
  Now, to load that lib just enter
  require 'ember'
  Don't worry about the filename it'll automatically load it, given the folder name
###
require 'handlebars'
require 'ember'

# loading bootstrap
require 'bootstrap-sass/bootstrap-transition'
require 'bootstrap-sass/bootstrap-alert'
require 'bootstrap-sass/bootstrap-button'
require 'bootstrap-sass/bootstrap-carousel'
require 'bootstrap-sass/bootstrap-collapse'
require 'bootstrap-sass/bootstrap-dropdown'
require 'bootstrap-sass/bootstrap-modal'
require 'bootstrap-sass/bootstrap-scrollspy'
require 'bootstrap-sass/bootstrap-tab'
require 'bootstrap-sass/bootstrap-tooltip'
require 'bootstrap-sass/bootstrap-popover'
require 'bootstrap-sass/bootstrap-typeahead'

###
  Whenever you require a folder name if will look for index.coffee in that folder name
  So, if you did not provide that file your console will throw an error
  Now, the following case it'll look for index.coffee in the app_name folder which will be
  loaded first !
###
require 'app_name'