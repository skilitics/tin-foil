Statement = require '../lib/statement'

describe 'Statement', ->
  before ->
    @user = 'Steve'
    @verb = 'completed'
    @object = 'scene'
    @context = 'scenario'
    @result = 'score'

    @statement = new Statement

  describe 'Fluent API', ->
    it 'should set the "Actor" from "as"', ->
      @statement.as @user
      @statement.actor.should.equal @user

    it 'should set the "Verb" from "i"', ->
      @statement.i @verb
      @statement.verb.should.equal @verb

    it 'should set the "Object" from "a"', ->
      @statement.a @object
      @statement.object.should.equal @object

    it 'should set the "Context" from "in"', ->
      @statement.in @context
      @statement.context.should.equal @context

    it 'should set the "Result" from "resulting_in"', ->
      @statement.resulting_in @result
      @statement.result.should.equal @result

    it 'should be fluent', ->
      s = Statement.as @user, i: @verb, an: @object, in: @context, resulting_in: @result
      s.actor.should.equal @user
      s.verb.should.equal @verb
      s.object.should.equal @object
      s.context.should.equal @context
      s.result.should.equal @result

#  describe 'Compiliation...'