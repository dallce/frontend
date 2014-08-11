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
    'ngAnimate'
    'ngCookies'
    'ngStorage'
    'ui.router'
    'ngSanitize'
    'ngTouch'
    'ui.bootstrap'
    'restangular'
  ]
  .config [
    '$urlRouterProvider'
    '$stateProvider'
    '$locationProvider'
    'RestangularProvider'
    ($urlRouterProvider, $stateProvider, $locationProvider, RestangularProvider) ->
      # $locationProvider
      #   .html5Mode true
      #   .hashPrefix '!'

      RestangularProvider.setBaseUrl('/api/v1')

      $urlRouterProvider.otherwise("/");

      $stateProvider
        .state 'main',
          url: '/'
          templateUrl: 'views/main.html'
          controller: 'MainCtrl'
        .state 'about',
          url: '/about'
          templateUrl: 'views/about.html'
          controller: 'AboutCtrl'
        .state 'login',
          url: '/login'
          templateUrl: 'views/login.html'
          controller: 'LoginCtrl'
        .state 'register',
          url: '/register'
          templateUrl: 'views/register.html'
          controller: 'SignUpCtrl'
        .state 'career',
          url: '/career/:id'
          templateUrl: 'views/career.html'
          controller: 'careerCtrl'

  ]
