All credits to the creators of Ember, Coffeescript, Ruby, Rake Pipeline, i18n support library, Twitter bootstrap, sass & makers of [ember-skeleton](https://github.com/interline/ember-skeleton)

I just fiddled around with ember-skeleton to come up with this, it's not perfect, any help is always welcomed

<b> Yet to add Test support, planning for Qunit Tests</b>

==============
Ember Coffeescript Skeleton
==============

A skeleton application framework using 
<ul>
    <li>Ember.js</li>
    <li>CoffeeScript</li>
    <li>Rake Pipeline</li>
    <li>i18n Support</li>
    <li>Twitter Bootstrap</li>
    <li>Sass/Scss</li>
</ul>

Running
-------
    clone this repository
    $ bundle install
    $ bundle exec rackup

App Structure
-------------

    ember-coffeescript-skeleton
    ├── app - App specific code
    │   ├── coffeescript - Your coffeescript related code
    │   │   ├── app_name - Folder with your application name
    │   │   │   ├── controllers - All ember controller related modules
    │   │   │   ├── fixtures - Fixture data if any
    │   │   │   ├── helpers - Helper files if any
    │   │   │   ├── i18n  - i18n support
    │   │   │   │   ├── languages - All language files go here
    │   │   │   │   ├── index.coffee
    │   │   │   │   └── languages_support.coffee - lib file
    │   │   │   ├── models - All Ember models related modules
    │   │   │   ├── templates - Handlebar templates go here
    │   │   │   ├── views - All ember view related modules
    │   │   │   ├── application.coffee - Create Ember Application here
    │   │   │   ├── index.coffee - Application is initialized here
    │   │   │   └── router.coffee - Ember Application Router file
    │   │   ├── main.coffee - Load your javascript libraries here along with the application
    │   ├── static - All your static files go here
    │   │   ├── fonts 
    │   │   ├── images
    │   │   ├── javascript
    │   │   └── index.html
    │   ├── stylesheet - All your scss files go here
    │   │   ├── images
    │   │   ├── application.scss 
    │   │   └── bootstrap.scss 
    │   ├── config
    │   │   └── application.rb 
    │   ├── lib
    │   │   └── asset_dependencies.rb
    │   └── vendor 
    │       └── javascript-create a new folder & add your js library, require with folder name in main.coffee    
    │           ├── ember - ember library
    │           └── handlebars - handlebars library
    ├── Assetfile - App build file
    ├── Gemfile - Package dependencies for rakep/rack
    ├── Gemfile.lock - Here be dragons: don't touch, always include
    ├── Guardfile
    ├── Rakefile
    └── config.ru

Files have comments embedded to help you out...