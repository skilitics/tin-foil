Result = require '../lib/result'
props = require './behaviours/props'

describe 'Result', ->

  beforeEach -> @result = Result.extend()

  describe 'score', ->
    props.shouldHaveProp 'result', 'score'
    props.shouldHaveAlias 'result', 'score', 'scored'
    props.shouldHaveAlias 'result', 'score', 'score_from'

    it 'should validate as a ScoreObject'

  describe 'success', ->
    props.shouldHaveProp 'result', 'success'
    props.shouldHaveAlias 'result', 'success', 'success_as'
    props.shouldHaveAlias 'result', 'success', 'success_from'

    it 'should validate as a Boolean'

  describe 'completion', ->
    props.shouldHaveProp 'result', 'completition'
    props.shouldHaveAlias 'result', 'completition', 'completed'
    props.shouldHaveAlias 'result', 'completition', 'completition_from'

    it 'should validate as a Boolean'

  describe 'response', ->
    props.shouldHaveProp 'result', 'response'
    props.shouldHaveAlias 'result', 'response', 'response_as'
    props.shouldHaveAlias 'result', 'response', 'response_from'

    it 'should validate as a String'

  describe 'duration', ->
    props.shouldHaveProp 'result', 'duration'
    props.shouldHaveAlias 'result', 'duration', 'duration_as'
    props.shouldHaveAlias 'result', 'duration', 'duration_from'

    it 'should validate as a Date'

  describe 'extensions', ->
    props.shouldHaveProp 'result', 'extensions'
    props.shouldHaveAlias 'result', 'extensions', 'with_extension'

    it 'should validate as a TinFoilCollection'
