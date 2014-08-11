'use strict'

describe 'Directive: userPanel', ->

  # load the directive's module
  beforeEach module 'client2App'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<user-panel></user-panel>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the userPanel directive'
