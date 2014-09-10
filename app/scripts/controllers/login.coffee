'use strict'

###*
 # @ngdoc function
 # @name dallceApp.controller:LoginCtrl
 # @description
 # # LoginCtrl
 # Controller of the dallceApp
###
angular.module('dallceApp')
  .controller 'LoginCtrl', ['$scope', 'auth', ($scope, auth) ->
    $scope.user = auth.info()
    $scope.credentials = {}

    $scope.signIn = ->
      auth.signIn $scope.credentials
    $scope.signOut = ->
      auth.signOut()

  ]

angular.module('dallceApp')
  .controller 'SignUpCtrl', ['$scope', 'auth', ($scope, auth) ->
    $scope.user = auth.info()
    $scope.credentials = {}

    $scope.signUp = ->
      auth.signUp $scope.credentials

  ]