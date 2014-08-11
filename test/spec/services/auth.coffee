'use strict'

describe 'Service: auth', ->

  # load the service's module
  beforeEach module 'client2App'

  # instantiate service
  auth = {}
  beforeEach inject (_auth_) ->
    auth = _auth_

  it 'should do something', ->
    expect(!!auth).toBe true
