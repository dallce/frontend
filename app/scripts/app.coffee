'use strict'

###*
 # @ngdoc overview
 # @name client2App
 # @description
 # # client2App
 #
 # Main module of the application.
###
angular
  .module('client2App', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'restangular'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

  .config [
    '$locationProvider'
    'RestangularProvider'
    ($locationProvider, RestangularProvider) ->
      RestangularProvider.setBaseUrl('http://dallce.dev:80/api/v1')
  ]