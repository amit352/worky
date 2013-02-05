require './application'
require './i18n'
require './models'
require './fixtures'
require './controllers'
require './helpers'
require './views'
require './router'

# Change language here
AppName.set('language', AppName.languages.en_us)

# Loading the application
AppName.initialize() unless Test?