{ DefinitionLoader, Statement, Agent, Activity, Verb, Context, Result } = require '../lib'
statement = require './behaviours/statement'

describe 'Statement', ->

  describe 'Fluent API', ->
    before ->
      @user = Agent.extend()
      @verb = Verb.extend()
      @activity = Activity.extend()
      @context = Context.extend()
      @result = Result.extend()

    beforeEach -> @statement = new Statement

    describe 'as', ->
      beforeEach -> @r = @statement.as @user
      it 'should set the "Actor"', -> @r.actor.should.equal @user
      it 'should be chainable', -> @r.should.equal @statement

      describe 'with "options"', ->
        beforeEach -> @r = @statement.as @user, i: @verb, a: @activity, in: @context, resulting_in: @result
        it 'should set the "Actor"', -> @r.actor.should.equal @user
        it 'should set the "Verb"', -> @r.verb.should.equal @verb
        it 'should set the "Object"', -> @r.object.should.equal @activity
        it 'should set the "Context"', -> @r.context.should.equal @context
        it 'should set the "Result"', -> @r.result.should.equal @result

    describe 'i', ->
      beforeEach -> @r = @statement.i @verb
      it 'should set the "Verb"', -> @r.verb.should.equal @verb
      it 'should be chainable', -> @r.should.equal @statement

    describe 'a', ->
      beforeEach -> @r = @statement.a @activity
      it 'should set the "Object"', -> @r.object.should.equal @activity
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
      @event =
        timestamp: new Date().toString()

      @user = Agent.extend()
      @completed = Verb.extend()
      @scene = Activity.extend()
      @scenario = Context
      @score = Result.extend()

    beforeEach ->
      @statement = new Statement

    describe 'with classes passed in', ->

      beforeEach ->
        @statement.as @user, i: @completed, a: @scene, in: @scenario, resulting_in: @score, at: @event.timestamp
        @r = @statement.compile @event

      statement.shouldCompile()

    describe 'with dynamic loading of classes', ->

      beforeEach ->
        @statement.loadDefinitionsFrom(new DefinitionLoader(this))
        @statement.as 'user', i: 'completed', a: 'scene', in_a: 'scenario', resulting_in_a: 'score', at: @event.timestamp
        @r = @statement.compile @event

      statement.shouldCompile()