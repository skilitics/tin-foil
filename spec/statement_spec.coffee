{ Statement, Agent, Verb, TinCanObject, Context, Result } = require '../lib'

describe 'Statement', ->
  before ->
    @user = Agent.extend().named 'Steve'
    @verb = Verb.extend().displayed_as 'en-US': 'completed'
    @tinCanObject = TinCanObject.extend().named 'scene'
    @context = Context.extend()
    @result = Result.extend()

  describe 'Fluent API', ->
    beforeEach -> @statement = new Statement

    describe 'as', ->
      beforeEach -> @r = @statement.as @user
      it 'should set the "Actor"', -> @r.actor.should.equal @user
      it 'should be chainable', -> @r.should.equal @statement

      describe 'with "options"', ->
        beforeEach -> @r = @statement.as @user, i: @verb, a: @tinCanObject, in: @context, resulting_in: @result
        it 'should set the "Actor"', -> @r.actor.should.equal @user
        it 'should set the "Verb"', -> @r.verb.should.equal @verb
        it 'should set the "Object"', -> @r.object.should.equal @tinCanObject
        it 'should set the "Context"', -> @r.context.should.equal @context
        it 'should set the "Result"', -> @r.result.should.equal @result

    describe 'i', ->
      beforeEach -> @r = @statement.i @verb
      it 'should set the "Verb"', -> @r.verb.should.equal @verb
      it 'should be chainable', -> @r.should.equal @statement

    describe 'a', ->
      beforeEach -> @r = @statement.a @tinCanObject
      it 'should set the "Object"', -> @r.object.should.equal @tinCanObject
      it 'should be chainable', -> @r.should.equal @statement

    describe 'in', ->
      beforeEach -> @r = @statement.in @context
      it 'should set the "Context"', -> @r.context.should.equal @context
      it 'should be chainable', -> @r.should.equal @statement

    describe 'resulting_in', ->
      beforeEach -> @r = @statement.resulting_in @result
      it 'should set the "Result"', -> @r.result.should.equal @result
      it 'should be chainable', -> @r.should.equal @statement

  describe 'Compiliation', ->

    beforeEach ->
      @event = {}
      @statement = new Statement()
      @statement.as @user, i: @verb, a: @tinCanObject, in: @context, resulting_in: @result
      @statement.complie @event

    it 'should set the "actor"', -> @r.actor.should.equal @actor.compile @event
    it 'should set the "verb"', -> @r.verb.should.equal @verb.compile()
    it 'should set the "object"', -> @r.object.should.equal @tinCanObject.complie @event
    it 'should set the "context"', -> @r.context.should.equal @context.complie @event
    it 'should set the "result"', -> @r.result.should.equal @result.complie @event
