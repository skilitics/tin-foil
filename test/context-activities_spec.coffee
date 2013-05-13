ContextActivities = require '../lib/context-activities'
props = require './behaviours/definitions'

describe 'Context Activities', ->

  beforeEach -> @contextActivities = ContextActivities.extend()

  describe 'parent', ->
    props.shouldHaveDefinition 'contextActivities', 'parent'
    props.shouldHaveAlias 'contextActivities', 'parent', 'parented_as'
    props.shouldHaveAlias 'contextActivities', 'parent', 'parent_from'

  describe 'grouping', ->
    props.shouldHaveDefinition 'contextActivities', 'grouping'
    props.shouldHaveAlias 'contextActivities', 'grouping', 'grouping_as'
    props.shouldHaveAlias 'contextActivities', 'grouping', 'grouping_from'

  describe 'category', ->
    props.shouldHaveDefinition 'contextActivities', 'category'
    props.shouldHaveAlias 'contextActivities', 'category', 'category_as'
    props.shouldHaveAlias 'contextActivities', 'category', 'category_from'

  describe 'other', ->
    props.shouldHaveDefinition 'contextActivities', 'other'
    props.shouldHaveAlias 'contextActivities', 'other', 'other_as'
    props.shouldHaveAlias 'contextActivities', 'other', 'other_from'