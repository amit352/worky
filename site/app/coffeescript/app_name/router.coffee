AppName.Router = Ember.Router.extend
  location: 'history'
  enableLogging: true

  root: Ember.Route.create
    showHome: Ember.Route.transitionTo('home')

    index: Ember.Route.create
      route: '/'
      redirectsTo: 'home'

    home: Ember.Route.create
      route: '/home'
      connectOutlets: (router) ->
        router.get('applicationController').connectOutlet('home')