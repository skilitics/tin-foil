Verb = require '../lib/verb'
props = require './behaviours/props'

describe 'Verb', ->

  beforeEach -> @verb = Verb.extend()

  describe 'id', ->
    props.shouldHaveProp 'verb', 'id'
    props.shouldHaveAlias 'verb', 'id', 'identified_as'
    props.shouldHaveAlias 'verb', 'id', 'identify_from'

    it 'should validate as a URI'

  describe 'display', ->
    props.shouldHaveProp 'verb', 'display'
    props.shouldHaveAlias 'verb', 'display', 'displayed_as'
    props.shouldHaveAlias 'verb', 'display', 'display_from'

    it 'should validate as a LanguageMap'
