Agent = require '../lib/agent'

describe 'Agent', ->

  beforeEach ->
    @agent = Agent.extend()

  describe 'objectType', ->
    it 'should be set to "Activity"', ->
      @scene.compile(@event).objectType.should.equal 'Activity'
