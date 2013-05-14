Verb = require '../lib/verb'
props = require './behaviours/definitions'

describe 'Verb', ->

  beforeEach -> @verb = Verb.extend()

  describe 'id', ->
    props.shouldHaveDefinition 'verb', 'id'
    props.shouldHaveAlias 'verb', 'id', 'identified_as'
    props.shouldHaveAlias 'verb', 'id', 'identify_from'

    it 'should validate as a URI'

  describe 'display', ->
    props.shouldHaveDefinition 'verb', 'display'
    props.shouldHaveAlias 'verb', 'display', 'displayed_as'
    props.shouldHaveAlias 'verb', 'display', 'display_from'

    it 'should validate as a LanguageMap'
