Activity = require '../lib/activity'
ActivityDefinition = require '../lib/activity-definition'

should = require('chai').should()

describe 'Activity', ->

  beforeEach ->
    @scene = Activity.extend()

    @event =
      id: '1234-5678'
      scene:
        title: 'A scene'

  describe 'objectType', ->
    it 'should be set to "Activity"', ->
      @scene.compile(@event).objectType.should.equal 'Activity'

  describe 'id', ->
    it 'should validate as a URI'

    it 'should set from "identified_as"', ->
      @scene
        .identified_as('1234-5678')
        .compile(@event).id.should.equal '1234-5678'

    it 'should set from "identify_from"', ->
      @scene
        .identify_from((event) -> event.id)
        .compile(@event).id.should.equal '1234-5678'

  describe 'definition', ->
    it 'should validate as an "ActivityDefinition"'
    it 'should be an "ActivityDefinition"'
#      @scene.properties['definition'].type.should.be.an.instanceOf ActivityDefinition
