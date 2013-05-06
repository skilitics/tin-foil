ActivityDefinition = require '../lib/activity-definition'
props = require './behaviours/props'
shouldBehaveLike = require './behaviours/should-behave-like'

should = require('chai').should()

describe 'Activity Definition', ->

  before -> @definition = ActivityDefinition.extend()

  describe 'name', ->
    props.shouldHaveProp 'definition', 'name'
    props.shouldHaveAlias 'definition', 'name', 'named'
    props.shouldHaveAlias 'definition', 'name', 'name_from'

    it 'should validate as a LanguageMap'

  describe 'description', ->
    props.shouldHaveProp 'definition', 'description'
    props.shouldHaveAlias 'definition', 'description', 'described_as'
    props.shouldHaveAlias 'definition', 'description', 'description_from'

    it 'should validate as a LanguageMap'

  describe 'type', ->
    props.shouldHaveProp 'definition', 'type'
    props.shouldHaveAlias 'definition', 'type', 'typed_as'
    props.shouldHaveAlias 'definition', 'type', 'type_from'

    it 'should validate as a URI'

  describe 'moreinfo', ->
    props.shouldHaveProp 'definition', 'moreinfo'
    props.shouldHaveAlias 'definition', 'moreinfo', 'more_info_as'
    props.shouldHaveAlias 'definition', 'moreinfo', 'more_info_from'

    it 'should validate as a URL'

  it 'should have interaction properties'
  it 'should have extensions'

  shouldBehaveLike.interactionActivities 'definition'