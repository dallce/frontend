'use strict'

###*
 # @ngdoc service
 # @name dallceApp.settings
 # @description
 # # settings
 # Constant in the dallceApp.
###
angular.module('dallceApp')
  .constant 'settings', {
    apiUrl: 'http://dallce.scixiv.com/api/v1'
  }
