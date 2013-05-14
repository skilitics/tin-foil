Activity = require '../lib/activity'
#ActivityDefinition = require '../lib/activity-definition'
props = require './behaviours/definitions'

should = require('chai').should()

describe 'Activity', ->

  beforeEach -> @scene = Activity.extend()

  describe 'objectType', ->
    it 'should be set to "Activity"', ->
      @scene.should.have.definition 'objectType', 'Activity'

  describe 'id', ->
    props.shouldHaveDefinition 'scene', 'id'
    props.shouldHaveAlias 'scene', 'id', 'identified_as'
    props.shouldHaveAlias 'scene', 'id', 'identify_from'

    it 'should validate as a URI'

  describe 'definition', ->
    props.shouldHaveDefinition 'scene', 'definition'

    it 'should validate as an ActivityDefinition'
