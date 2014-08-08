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
  .module 'client2App', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'restangular'
  ]
  .config [
    '$routeProvider'
    '$locationProvider'
    'RestangularProvider'
    ($routeProvider, $locationProvider, RestangularProvider) ->
      # $locationProvider
      #   .html5Mode true
      #   .hashPrefix '!'

      RestangularProvider.setBaseUrl('/api/v1')

      $routeProvider
        .when '/',
          templateUrl: 'views/main.html'
          controller: 'MainCtrl'
        .when '/about',
          templateUrl: 'views/about.html'
          controller: 'AboutCtrl'
        .otherwise
          redirectTo: '/'
  ]