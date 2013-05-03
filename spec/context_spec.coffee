Context = require '../lib/context'
props = require './behaviours/props'

describe 'Context', ->

  before -> @context = Context.extend()

  describe 'registration', ->
    props.shouldHaveProp 'context', 'registration'
    props.shouldHaveAlias 'context', 'registration', 'registered_as'
    props.shouldHaveAlias 'context', 'registration', 'registration_from'

    it 'should validate as a UUID'

  describe 'instructor', ->
    props.shouldHaveProp 'context', 'instructor'

    it 'should validate as an Agent'

  describe 'team', ->
    props.shouldHaveProp 'context', 'team'

    it 'should validate as a Group'

  describe 'contextActivities', ->
    props.shouldHaveProp 'context', 'contextActivities'

    it 'should validate as a ContextActivities'

  describe 'revision', ->
    props.shouldHaveProp 'context', 'revision'
    props.shouldHaveAlias 'context', 'revision', 'revisioned_as'
    props.shouldHaveAlias 'context', 'revision', 'revision_from'

    it 'should validate as a String'

  describe 'platform', ->
    props.shouldHaveProp 'context', 'platform'
    props.shouldHaveAlias 'context', 'platform', 'platform_as'
    props.shouldHaveAlias 'context', 'platform', 'platform_from'

    it 'should validate as a String'

  describe 'statement', ->

  describe 'extensions', ->
    props.shouldHaveProp 'context', 'extensions'

    it 'should validate as an Extensions'