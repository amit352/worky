
window.loc = (key, vars) ->
  string = Ember.get(AppName.language, key) || key
  vars = [vars] if typeof vars == 'string'
  if typeof string == 'string'
    Ember.String.fmt(string, vars)
  else
    Ember.warn((if string? 'Invalid message code[#{key}]. Is it a message code category?' else 'Unable to locate message code #{key}'), true)
    key

window.t = (key, vars) -> (-> loc(key, vars)).property('AppName.language')

msg = Ember.Object.create
  unknownProperty: (key) -> Ember.get(AppName.language, key) || key

Ember.View.reopen
  msg: (-> msg).property('AppName.language')

Ember.ControllerMixin.reopen
  msg: (-> msg).property('AppName.language')

Ember.Handlebars.registerHelper 'loc', ->
  args = [].slice.apply(arguments)
  key = args.shift()
  options = args.pop()
  vars = (@getPath(arg) for arg in args) || []
  Ember.String.htmlSafe(loc(key, vars))

AppName.languages = {}
