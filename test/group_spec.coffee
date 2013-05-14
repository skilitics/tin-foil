Group = require '../lib/group'
props = require './behaviours/definitions'

describe 'Group', ->

  beforeEach -> @group = Group.extend()

  describe 'objectType', ->
    it 'should be set to "Group"', ->
      @group.should.have.definition 'objectType', 'Group'

  describe 'name', ->
    props.shouldHaveDefinition 'group', 'name'
    props.shouldHaveAlias 'group', 'name', 'named'
    props.shouldHaveAlias 'group', 'name', 'name_from'

    it 'should validate as a String'

  describe 'member', ->
    props.shouldHaveDefinition 'group', 'member'
    props.shouldHaveAlias 'group', 'member', 'add_member'

    it 'should validate as a TinFoilCollection of Agents'