'use strict'

###*
 # @ngdoc overview
 # @name dallceApp
 # @description
 # # dallceApp
 #
 # Main module of the application.
###
angular
  .module 'dallceApp', [
    'ngAnimate'
    'ngCookies'
    'ngStorage'
    'ui.router'
    'ngSanitize'
    'ngTouch'
    'ui.bootstrap'
    'restangular'
    'Satellizer'
  ]
  .config [
    '$urlRouterProvider'
    '$stateProvider'
    '$locationProvider'
    'RestangularProvider'
    'settings'
    ($urlRouterProvider, $stateProvider, $locationProvider, RestangularProvider, settings) ->
      $locationProvider
        .html5Mode true
        # .hashPrefix '!'

      RestangularProvider.setBaseUrl settings.apiUrl

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
