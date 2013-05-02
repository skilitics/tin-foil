Activity = require '../lib/activity'
#ActivityDefinition = require '../lib/activity-definition'
props = require './behaviours/props'

should = require('chai').should()

describe 'Activity', ->

  beforeEach -> @scene = Activity.extend()

  describe 'objectType', ->
    it 'should be set to "Activity"', ->
      @scene.should.have.prop 'objectType', 'Activity'

  describe 'id', ->
    props.shouldHaveProp 'scene', 'id'
    props.shouldHaveAlias 'scene', 'id', 'identified_as'
    props.shouldHaveAlias 'scene', 'id', 'identify_from'

    it 'should validate as a URI'
