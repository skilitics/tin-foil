ActivityDefinition = require '../lib/activity-definition'
props = require './behaviours/definitions'
shouldBehaveLike = require './behaviours/should-behave-like'

should = require('chai').should()

describe 'Activity Definition', ->

  before -> @definition = ActivityDefinition.extend()

  describe 'name', ->
    props.shouldHaveDefinition 'definition', 'name'
    props.shouldHaveAlias 'definition', 'name', 'named'
    props.shouldHaveAlias 'definition', 'name', 'name_from'

    it 'should validate as a LanguageMap'

  describe 'description', ->
    props.shouldHaveDefinition 'definition', 'description'
    props.shouldHaveAlias 'definition', 'description', 'described_as'
    props.shouldHaveAlias 'definition', 'description', 'description_from'

    it 'should validate as a LanguageMap'

  describe 'type', ->
    props.shouldHaveDefinition 'definition', 'type'
    props.shouldHaveAlias 'definition', 'type', 'typed_as'
    props.shouldHaveAlias 'definition', 'type', 'type_from'

    it 'should validate as a URI'

  describe 'moreinfo', ->
    props.shouldHaveDefinition 'definition', 'moreinfo'
    props.shouldHaveAlias 'definition', 'moreinfo', 'more_info_as'
    props.shouldHaveAlias 'definition', 'moreinfo', 'more_info_from'

    it 'should validate as a URL'

  shouldBehaveLike.interactionActivities 'definition'

  describe 'extensions', ->
    props.shouldHaveDefinition 'definition', 'extensions'
    props.shouldHaveAlias 'definition', 'extensions', 'with_extension'

    it 'should validate as a TinFoilMap'
