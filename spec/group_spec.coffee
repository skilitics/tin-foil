Group = require '../lib/group'
props = require './behaviours/props'

describe 'Group', ->

  beforeEach -> @group = Group.extend()

  describe 'objectType', ->
    it 'should be set to "Group"', ->
      @group.should.have.prop 'objectType', 'Group'

  describe 'name', ->
    props.shouldHaveProp 'group', 'name'
    props.shouldHaveAlias 'group', 'name', 'named'
    props.shouldHaveAlias 'group', 'name', 'name_from'

    it 'should validate as a String'

  describe 'member', ->
    props.shouldHaveProp 'group', 'member'
    props.shouldHaveAlias 'group', 'member', 'add_member'

    it 'should validate as a TinFoilCollection of Agents'