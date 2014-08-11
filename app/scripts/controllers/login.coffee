'use strict'

###*
 # @ngdoc function
 # @name client2App.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the client2App
###
angular.module('client2App')
  .controller 'LoginCtrl', ['$scope', 'auth', ($scope, auth) ->
    $scope.user = auth.info()
    $scope.credentials = {}

    $scope.signIn = ->
      auth.signIn $scope.credentials
    $scope.signOut = ->
      auth.signOut()

  ]

angular.module('client2App')
  .controller 'SignUpCtrl', ['$scope', 'auth', ($scope, auth) ->
    $scope.user = auth.info()
    $scope.credentials = {}

    $scope.signUp = ->
      auth.signUp $scope.credentials

  ]