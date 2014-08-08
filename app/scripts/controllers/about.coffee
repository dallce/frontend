'use strict'

###*
 # @ngdoc function
 # @name client2App.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the client2App
###
angular.module('client2App')
  .controller 'AboutCtrl', ['$scope', 'Restangular', ($scope, Restangular) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    $scope.careers = Restangular.all('careers').getList().$object
  ]