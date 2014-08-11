'use strict'

###*
 # @ngdoc service
 # @name client2App.auth
 # @description
 # # auth
 # Factory in the client2App.
###
angular.module('client2App')
  .factory 'auth', ['$localStorage', '$http', '$state', ($localStorage, $http, $state)->
    # Service logic
    # ...

    $localStorage.currentUser ?=
      signedIn: false
      token: ''

    $http.defaults.headers.common['Auth-Token'] = $localStorage.currentUser.token

    # Public API here
    {
      signIn: (user)->
        $http.post('api/v1/auth/login', user)
        .success (data) ->
          $localStorage.currentUser.token = data.authentication_token
          $localStorage.currentUser.id = data.id
          $localStorage.currentUser.email = data.email
          $localStorage.currentUser.signedIn = true
          $http.defaults.headers.common['Auth-Token'] = $localStorage.currentUser.token
          $state.go('main')

      signOut: ->
        $localStorage.currentUser.signedIn = false
        $localStorage.currentUser.token = ''
        $http.defaults.headers.common['Auth-Token'] = ''

      signUp: (user) ->
        $http.post('api/v1/auth/signup', user)
        .success (data) ->
          $localStorage.currentUser.token = data.authentication_token
          $localStorage.currentUser.id = data.id
          $localStorage.currentUser.email = data.email
          $localStorage.currentUser.signedIn = true
          $http.defaults.headers.common['Auth-Token'] = $localStorage.currentUser.token
          $state.go('main')
      info: ->
        $localStorage.currentUser

    }
  ]