'use strict'

###*
 # @ngdoc function
 # @name client2App.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the client2App
###
angular.module('client2App')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
