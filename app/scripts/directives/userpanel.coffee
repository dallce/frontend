'use strict'

###*
 # @ngdoc directive
 # @name dallceApp.directive:userPanel
 # @description
 # # userPanel
###
angular.module('dallceApp')
  .directive('userPanel', ->
    templateUrl: 'views/user_panel.html'
    restrict: 'EA'
    replace: true
    transclude: true
    controller: 'LoginCtrl'
  )

angular.module('dallceApp')
  .directive('dcMatch', ->
    restrict: "A"
    scope: true
    require: "ngModel"
    link: (scope, elem, attrs, control) ->
      checker = ->

        #get the value of the first password
        e1 = scope.$eval(attrs.ngModel)

        #get the value of the other password
        e2 = scope.$eval(attrs.dcMatch)
        e1 is e2

      scope.$watch checker, (val) ->
        #set the form control to valid if both
        #passwords are the same, else invalid
        control.$setValidity "unique", val
  )