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
    $scope.baseCareers = Restangular.all('careers')
    $scope.careers = $scope.baseCareers.getList().$object

    $scope.saveCareer = (career) ->
      $scope.baseCareers.post(career).then (career)->
        $scope.careers.push career
        console.log career
      , ->
        console.log 'shit'

    $scope.delete = (career) ->
      career.remove().then ->
        $scope.careers = _.without $scope.careers, career

  ]

angular.module('client2App')
  .controller 'careerCtrl', [
    '$scope', 'Restangular', '$stateParams'
    ($scope, Restangular, $stateParams) ->

      Restangular.one('careers', $stateParams.id).get().then (career) ->
        $scope.career = career



      $scope.saveCareer = (career) ->
        $scope.baseCareers.post(career).then (career)->
          $scope.careers.push career
          console.log career
        , ->
          console.log 'shit'

      $scope.delete = (career) ->
        career.remove().then ->
          $scope.careers = _.without $scope.careers, career

  ]

