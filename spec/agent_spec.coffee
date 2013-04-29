Agent = require '../lib/objects/agent'
agent = require './behaviours/agent'

# Not sure why only this spec needs this included?
should = require('chai').should()

describe 'Agent', ->
  before ->
    @e =
      name: 'John Doe'
      email: 'john.doe@example.com'

#  it 'should have "objectType" of "Agent"', -> Agent.objectType.should.equal 'Agent'
#  it 'should extend TinCanObject...'

  describe 'Fluent API', ->
    beforeEach -> @CustomAgent = Agent.extend()

    describe 'name_from', ->
      beforeEach -> @r = @CustomAgent.name_from @e.name
      it 'should set the "name"', -> @r.agentName.should.equal @e.name
      it 'should be chainable', -> @r.should.equal @CustomAgent

    describe 'named', ->
      beforeEach -> @r = @CustomAgent.named @e.name
      it 'should set the "name"', -> @r.agentName.should.equal @e.name
      it 'should be chainable', -> @r.should.equal @CustomAgent

    describe 'mbox_from', ->
      beforeEach -> @r = @CustomAgent.mbox_from @e.email
      it 'should set the "name"', -> @r.agentMbox.should.equal @e.email
      it 'should be chainable', -> @r.should.equal @CustomAgent

    describe 'mbox_as', ->
      beforeEach -> @r = @CustomAgent.mbox_as @e.email
      it 'should set the "name"', -> @r.agentMbox.should.equal @e.email
      it 'should be chainable', -> @r.should.equal @CustomAgent

  describe 'Compliation', ->

    describe 'with static values', ->
      before ->
        @CustomAgent = Agent.extend()
        @CustomAgent
          .named(@e.name)
          .mbox_as(@e.email)

        @r = @CustomAgent.compile(@e)

      agent.shouldComplie()

    describe 'with dynamic values', ->
      before ->
        @CustomAgent = Agent.extend()
        @CustomAgent
          .name_from((event) -> event.name)
          .mbox_from((event) -> event.email)

        @r = @CustomAgent.compile(@e)

      agent.shouldComplie()