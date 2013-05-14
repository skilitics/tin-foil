Context = require '../lib/context'
props = require './behaviours/definitions'

describe 'Context', ->

  before ->
    @context = Context.extend()
#    @context.with_extension 'skilitix.com/organization', '1234-5678'
#    @context.with_extension 'skilitix.com/tenantId', (event) -> event.tenantId

  describe 'registration', ->
    props.shouldHaveDefinition 'context', 'registration'
    props.shouldHaveAlias 'context', 'registration', 'registered_as'
    props.shouldHaveAlias 'context', 'registration', 'registration_from'

    it 'should validate as a UUID'

  describe 'instructor', ->
    props.shouldHaveDefinition 'context', 'instructor'

    it 'should validate as an Agent'

  describe 'team', ->
    props.shouldHaveDefinition 'context', 'team'

    it 'should validate as a Group'

  describe 'contextActivities', ->
    props.shouldHaveDefinition 'context', 'contextActivities'

    it 'should validate as a ContextActivities'

  describe 'revision', ->
    props.shouldHaveDefinition 'context', 'revision'
    props.shouldHaveAlias 'context', 'revision', 'revisioned_as'
    props.shouldHaveAlias 'context', 'revision', 'revision_from'

    it 'should validate as a String'

  describe 'platform', ->
    props.shouldHaveDefinition 'context', 'platform'
    props.shouldHaveAlias 'context', 'platform', 'platform_as'
    props.shouldHaveAlias 'context', 'platform', 'platform_from'

    it 'should validate as a String'

  describe 'language', ->
    props.shouldHaveDefinition 'context', 'language'
    props.shouldHaveAlias 'context', 'language', 'language_as'
    props.shouldHaveAlias 'context', 'language', 'language_from'

    it 'should validate as a String'

  describe 'statement', ->

  describe 'extensions', ->
    props.shouldHaveDefinition 'context', 'extensions'

    it 'should validate as an Extensions'