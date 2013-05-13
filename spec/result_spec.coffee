Result = require '../lib/result'
props = require './behaviours/definitions'

describe 'Result', ->

  beforeEach -> @result = Result.extend()

  describe 'score', ->
    props.shouldHaveDefinition 'result', 'score'
    props.shouldHaveAlias 'result', 'score', 'scored'
    props.shouldHaveAlias 'result', 'score', 'score_from'

    it 'should validate as a ScoreObject'

  describe 'success', ->
    props.shouldHaveDefinition 'result', 'success'
    props.shouldHaveAlias 'result', 'success', 'success_as'
    props.shouldHaveAlias 'result', 'success', 'success_from'

    it 'should validate as a Boolean'

  describe 'completion', ->
    props.shouldHaveDefinition 'result', 'completion'
    props.shouldHaveAlias 'result', 'completion', 'completed'
    props.shouldHaveAlias 'result', 'completion', 'completion_from'

    it 'should validate as a Boolean'

  describe 'response', ->
    props.shouldHaveDefinition 'result', 'response'
    props.shouldHaveAlias 'result', 'response', 'response_as'
    props.shouldHaveAlias 'result', 'response', 'response_from'

    it 'should validate as a String'

  describe 'duration', ->
    props.shouldHaveDefinition 'result', 'duration'
    props.shouldHaveAlias 'result', 'duration', 'duration_as'
    props.shouldHaveAlias 'result', 'duration', 'duration_from'

    it 'should validate as a Date'

  describe 'extensions', ->
    props.shouldHaveDefinition 'result', 'extensions'
    props.shouldHaveAlias 'result', 'extensions', 'with_extension'

    it 'should validate as a TinFoilCollection'
