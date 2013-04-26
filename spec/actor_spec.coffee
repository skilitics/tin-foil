Agent = require '../lib/objects/agent'
should = require('chai').should()

describe 'Agent', ->
  before ->
    @agent = new Agent

  it 'should have "objectType" of "Agent"', -> Agent.objectType.should.equal 'Agent'

  it 'should compile'
