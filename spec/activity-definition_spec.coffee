ActivityDefinition = require '../lib/activity-definition'

describe 'Activity Definition', ->

  beforeEach ->
    @definition = ActivityDefinition.extend()
    @event =
      id: '1234-5678'

    describe 'name', ->
      it 'should have alias "named"', -> @definition.should.respondTo 'named'
      it 'should have alias "name_from"', -> @definition.should.respondTo 'name_from'

    describe 'description', ->
      it 'should have alias "described_as"', -> @definition.should.respondTo 'described_as'
      it 'should have alias "description_from"', -> @definition.should.respondTo 'description_from'

    describe 'type', ->
      it 'should have alias "typed_as"', -> @definition.should.respondTo 'typed_as'
      it 'should have alias "type_from"', -> @definition.should.respondTo 'type_from'
