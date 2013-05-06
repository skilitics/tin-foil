ContextActivities = require '../lib/context-activities'
props = require './behaviours/props'

describe 'Context Activities', ->

  beforeEach -> @contextActivities = ContextActivities.extend()

  describe 'parent', ->
    props.shouldHaveProp 'contextActivities', 'parent'
    props.shouldHaveAlias 'contextActivities', 'parent', 'parented_as'
    props.shouldHaveAlias 'contextActivities', 'parent', 'parent_from'

  describe 'grouping', ->
    props.shouldHaveProp 'contextActivities', 'grouping'
    props.shouldHaveAlias 'contextActivities', 'grouping', 'grouping_as'
    props.shouldHaveAlias 'contextActivities', 'grouping', 'grouping_from'

  describe 'category', ->
    props.shouldHaveProp 'contextActivities', 'category'
    props.shouldHaveAlias 'contextActivities', 'category', 'category_as'
    props.shouldHaveAlias 'contextActivities', 'category', 'category_from'

  describe 'other', ->
    props.shouldHaveProp 'contextActivities', 'other'
    props.shouldHaveAlias 'contextActivities', 'other', 'other_as'
    props.shouldHaveAlias 'contextActivities', 'other', 'other_from'