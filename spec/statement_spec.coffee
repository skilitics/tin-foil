{ DefinitionLoader, Statement, Agent, Verb, TinCanObject, Context, Result } = require '../lib'
statement = require './behaviours/statement'

describe 'Statement', ->
  before ->
    @user = Agent.extend().named 'Steve'
    @verb = Verb.extend().displayed_as 'en-US': 'completed'
    @tinCanObject = TinCanObject.extend().named 'scene'
    @context = Context.extend()
    @result = Result.extend().scored_as '1'

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

    before ->
      @event = {}
      @user = Agent.extend().named 'Steve'
      @completed = Verb.extend().displayed_as 'en-US': 'completed'
      @scene = TinCanObject.extend().named 'scene'
      @scenario = Context.extend()
      @score = Result.extend().scored_as '1'

    beforeEach ->
      @statement = new Statement

    describe 'with classes passed in', ->

      beforeEach ->
        @statement.as @user, i: @completed, a: @scene, in: @scenario, resulting_in: @score
        @r = @statement.compile @event

      statement.shouldCompile()

    describe 'with dynamic loading of classes', ->

      beforeEach ->
        @statement.loadDefinitionsFrom(new DefinitionLoader(this))
        @statement.as 'user', i: 'completed', a: 'scene', in_a: 'scenario', resulting_in_a: 'score'
        @r = @statement.compile @event

      statement.shouldCompile()