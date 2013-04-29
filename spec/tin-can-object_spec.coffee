TinCanObject = require '../lib/tin-can-object'
tinCanObject = require './behaviours/tin-can-object'

describe 'Tin Can Object', ->
  before ->
    @e =
      id: '/activities/scenario/123/456'
      objectType: 'Activity'
      type: 'scenario'
      name: 'Purposeful Conversations - SM'
      description: 'As the Store Manager, your role in this scenario is to deal...'

  describe 'Fluent API', ->
    beforeEach -> @Scenario = TinCanObject.extend()

    describe 'of_type', ->
      beforeEach -> @r = @Scenario.of_type @e.type
      it 'should set "objectType"', -> @r.objectType.should.equal @e.type
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'identified_as', ->
      beforeEach -> @r = @Scenario.identified_as @e.id
      it 'should set "id"', -> @r.id.should.equal @e.id
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'identified_by', ->
      beforeEach -> @r = @Scenario.identified_by @e.id
      it 'should set "id"', -> @r.id.should.equal @e.id
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_type_from', ->
      beforeEach -> @r = @Scenario.definition_type_from 'en-US': @e.name
      it 'should set "definition.name"', -> @r.definitionType['en-US'].should.equal @e.name
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_type_as', ->
      beforeEach -> @r = @Scenario.definition_type_as 'en-US': @e.name
      it 'should set "definition.name"', -> @r.definitionType['en-US'].should.equal @e.name
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_named_from', ->
      beforeEach -> @r = @Scenario.definition_named_from 'en-US': @e.name
      it 'should set "definition.name"', -> @r.definitionName['en-US'].should.equal @e.name
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_named_as', ->
      beforeEach -> @r = @Scenario.definition_named_as 'en-US': @e.name
      it 'should set "definition.name"', -> @r.definitionName['en-US'].should.equal @e.name
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_described_by', ->
      beforeEach -> @r = @Scenario.definition_described_by 'en-US': @e.description
      it 'should set "definition.description"', -> @r.definitionDescription['en-US'].should.equal @e.description
      it 'should be chainable', -> @r.should.equal @Scenario

    describe 'definition_described_as', ->
      beforeEach -> @r = @Scenario.definition_described_as 'en-US': @e.description
      it 'should set "definition.description"', -> @r.definitionDescription['en-US'].should.equal @e.description
      it 'should be chainable', -> @r.should.equal @Scenario

  describe 'Compiliation', ->

    describe 'with static values', ->
      before ->
        @Scenario = TinCanObject.extend()
        @Scenario
          .identified_as(@e.id)
          .of_type(@e.type)
          .definition_named_as('en-US': @e.name)
          .definition_described_as('en-US': @e.description)

        @r = @Scenario.compile(@e)

      tinCanObject.shouldCompile()

    describe 'with dynamic values', ->
      before ->
        @Scenario = TinCanObject.extend()
        @Scenario
          .identified_by((event) -> event.id)
          .of_type((event) -> event.type)
          .definition_named_as((event) -> 'en-US': event.name)
          .definition_described_by((event) -> 'en-US': event.description)

        @r = @Scenario.compile(@e)

      tinCanObject.shouldCompile()
