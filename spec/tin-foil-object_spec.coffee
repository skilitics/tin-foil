TinFoilObject = require '../lib/tin-foil-object'
TinFoilCollection = require '../lib/tin-foil-collection'
TinFoilMap = require '../lib/tin-foil-map'

should = require('chai').should()
expect = require('chai').expect

describe 'TinFoilObject', ->

  beforeEach -> @base = TinFoilObject.extend()

  describe 'Setting properties', ->

    it 'should allow setting static properties', ->
      @base.set 'property', to: 'a-static-value'
      @base.get('property').value.should.equal 'a-static-value'

    it 'should allow overriding set properties', ->
      @base.set 'property', to: 'a-static-value'
      @base.set 'property', to: 'an-overidden-static-value'
      @base.get('property').value.should.equal 'an-overidden-static-value'

    it 'should allow setting dynamic properties', ->
      @base.set 'property', to: -> 'a-dynamic-value'
      @base.compile().property.should.equal 'a-dynamic-value'

    it 'should be chainable', ->
      @base.set('objectType', to: 'a-static-value').should.equal @base

  describe 'Getting properties', ->

    it 'should allow getting a property', ->
      @base.set 'property', to: 'a-static-value'
      @base.get('property').value.should.equal 'a-static-value'

    it 'should throw an error if the property does not exist', ->
      ( => @base.get('does-not-exist')).should.throw 'Property [does-not-exist] has not been defined'

  describe 'Adding properties', ->

    it 'should allow adding properties', ->
      @base.add 'property'
      ( => @base.get('property')).should.not.throw()

    it 'should allow adding typed properties', ->
      @base.add 'property', String
      prop = @base.get('property')
      prop.type.should.equal String

    it 'should allow adding aliases', ->
      @base.add 'property', String, ['add_property', 'set_property']
      expect(@base.add_property).to.not.be.undefined
      expect(@base.set_property).to.not.be.undefined

    it 'should be chainable', ->
      @base.add('property').should.equal @base

  describe 'Aliases', ->

    it 'should be able to set static property values', ->
      @base.add 'property', String, ['set_property']
      @base.set_property 'a-static-value'
      @base.get('property').value.should.equal 'a-static-value'

    it 'should be able to set dynamic property values', ->
      @base.add 'property', String, ['set_property']
      @base.set_property -> 'a-dynamic-value'
      @base.compile().property.should.equal 'a-dynamic-value'

  describe 'Fluent prop', ->

    it 'should be able to set properties', ->
      @base.prop 'property', as: String, aliases: ['add_property', 'set_property']
      prop = @base.get('property')
      prop.type.should.equal String
      expect(@base.add_property).to.not.be.undefined
      expect(@base.set_property).to.not.be.undefined

    it 'should be chainable', ->
      @base.prop('property', as: String).should.equal @base

  describe 'Nested properties', ->

    beforeEach ->
      @nest = TinFoilObject.extend()
      @nest.prop 'nested_property', as: String, aliases: ['add_nested_alias', 'set_nested_alias']
      @base.prop 'nest', as: @nest

    it 'should be able to set nested properties', ->
      @base.get('nest').type.should.equal @nest

    it 'should be able to map to the nested property', ->
      expect(@base.get('nest')).to.not.be.undefined

    it 'should be able to map to the nested property aliases', ->
      expect(@base.nest_add_nested_alias).to.not.be.undefined
      expect(@base.nest_set_nested_alias).to.not.be.undefined

    it 'should be able to set static values on nested properties', ->
      @base.nest_set_nested_alias 'static-value'
      @base.get('nest').type.get('nested_property').value.should.equal 'static-value'

    it 'should be able to set dynamic values on nested properties', ->
      @base.nest_set_nested_alias -> 'a-dynamic-value'
      @base.compile().nest.nested_property.should.equal 'a-dynamic-value'

  describe 'Collections', ->

    beforeEach ->
      @base.prop 'collection', as: TinFoilCollection, aliases: ['add_to_my_collection']

    it 'should map the collection aliases', ->
      expect(@base.add_to_my_collection).to.not.be.undefined

    it 'should allow adding static properties to the collection', ->
      @base.add_to_my_collection 'some-value'
      @base.add_to_my_collection 'another-value'
      @base.compile().collection[0].should.equal 'some-value'
      @base.compile().collection[1].should.equal 'another-value'

    it 'should allow adding dynamic properties to the collection', ->
      @base.add_to_my_collection -> 'some-value'
      @base.add_to_my_collection -> 'another-value'
      @base.compile().collection[0].should.equal 'some-value'
      @base.compile().collection[1].should.equal 'another-value'

  describe 'Maps', ->

    beforeEach ->
      @base.prop 'my_map', as: TinFoilMap, aliases: ['add_to_my_map']

    it 'should map the map aliases', ->
      expect(@base.add_to_my_map).to.not.be.undefined

    it 'should allow adding static properties to the map', ->
      @base.add_to_my_map 'some-key', 'some-value'
      @base.add_to_my_map 'another-key', 'another-value'
      @base.compile().my_map['some-key'].should.equal 'some-value'
      @base.compile().my_map['another-key'].should.equal 'another-value'

    it 'should allow adding dynamic properties to the map', ->
      @base.add_to_my_map 'some-key', -> 'some-value'
      @base.add_to_my_map 'another-key', -> 'another-value'
      @base.compile().my_map['some-key'].should.equal 'some-value'
      @base.compile().my_map['another-key'].should.equal 'another-value'