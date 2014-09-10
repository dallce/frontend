'use strict'

###*
 # @ngdoc function
 # @name dallceApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the dallceApp
###
angular.module('dallceApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
