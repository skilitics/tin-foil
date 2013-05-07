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
      @base.prop 'property'
      ( => @base.get('property')).should.not.throw()

    it 'should allow adding typed properties', ->
      @base.prop 'property', as: String
      prop = @base.get('property')
      prop.type.should.equal String

    it 'should allow adding aliases', ->
      @base.prop 'property', aliases: ['add_property', 'set_property']
      expect(@base.add_property).to.not.be.undefined
      expect(@base.set_property).to.not.be.undefined

    it 'should be chainable', ->
      @base.prop('property').should.equal @base

  describe 'Aliases', ->

    it 'should be able to set static property values', ->
      @base.prop 'property', aliases: ['set_property']
      @base.set_property 'a-static-value'
      @base.get('property').value.should.equal 'a-static-value'

    it 'should be able to set dynamic property values', ->
      @base.prop 'property', aliases: ['set_property']
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

  describe 'Mixins', ->

    beforeEach ->
      @mix = TinFoilObject.extend()
      @mix.prop 'mixed', as: String, aliases: ['mixed_in']
      @base.prop 'keep', as: String, aliases: ['keep_me']
      @base.mixin @mix

    it 'should mix in the properties', ->
      expect(@base.get('mixed')).to.not.be.undefined

    it 'should map the mixin aliases', ->
      expect(@base.mixed_in).to.not.be.undefined

    it 'should still have the base properties', ->
      expect(@base.get('keep')).to.not.be.undefined

    it 'should still have the base aliases', ->
      expect(@base.keep_me).to.not.be.undefined


  describe 'Extend', ->

    beforeEach ->
      @base.prop 'extension', as: String, aliases: ['my_extension'], default_as: 'original-value'
      @extended = @base.extend()

    it 'should extend the object', ->
      @extended.prototype.should.be.instanceOf @base

    it 'should still have the base methods', ->
      expect(@extended.get('extension')).to.not.be.undefined

    it 'should still have the aliases', ->
      expect(@extended.my_extension).to.not.be.undefined

    it 'should not alter base properties', ->
      @extended.my_extension 'new-value'
      @base.get('extension').value.should.equal 'original-value'

  describe 'Compilation', ->

    beforeEach ->
      @event =
        property2: 'property2'
        nest:
          nested: 'nested'
        mix: 'mixed'
        collectionValue2: 'collection value 2'
        nestedCollectionValue2: 'nested collection value 2'
        mapValue2: 'map value 2'
        nestedMapValue2: 'nested map value 2'

      @nest = TinFoilObject.extend()
      @nest.set 'nested', to: (event) -> event.nest.nested
      @nest.prop 'map', as: TinFoilMap, aliases: ['add_to_map']
      @nest.prop 'collection', as: TinFoilCollection, aliases: ['add_to_collection']

      @mix = TinFoilObject.extend()
      @mix.set 'mix', to: (event) -> event.mix

      @base.set 'property_1', 'property1'
      @base.set 'property_2', (event) -> event.property2
      @base.prop 'not_set'
      @base.prop 'nest', as: @nest
      @base.mixin @mix

      @base.prop 'empty_collection', as: TinFoilCollection
      @base.prop 'collection', as: TinFoilCollection, aliases: ['add_to_collection']
      @base.add_to_collection 'collection value 1'
      @base.add_to_collection (event) -> event.collectionValue2
      @base.nest_add_to_collection 'nested collection value 1'
      @base.nest_add_to_collection (event) -> event.nestedCollectionValue2

      @base.prop 'empty_map', as: TinFoilMap
      @base.prop 'map', as: TinFoilMap, aliases: ['add_to_map']
      @base.add_to_map 'map_value_1', 'map value 1'
      @base.add_to_map 'map_value_2', (event) -> event.mapValue2
      @base.nest_add_to_map 'nested_map_value_1', 'nested map value 1'
      @base.nest_add_to_map 'nested_map_value_2', (event) -> event.nestedMapValue2

      @compiled = @base.compile @event

    it 'should compile static properties', ->
      @compiled.property_1.should.equal 'property1'

    it 'should compile dynamic properties', ->
      @compiled.property_2.should.equal 'property2'

    it 'should compile nested properties', ->
      @compiled.nest.nested.should.equal 'nested'

    it 'should compile mixed properties', ->
      @compiled.mix.should.equal 'mixed'

    it 'should not include properties with a value of "undefined"', ->
      expect(@compiled.not_set).to.be.undefined

    describe 'collections', ->
      it 'should not include empty collections', ->
        expect(@compiled.empty_collection).to.be.undefined

      it 'should compile the collection', ->
        @compiled.collection.should.be.an 'Array'
        @compiled.collection[0].should.equal 'collection value 1'
        @compiled.collection[1].should.equal 'collection value 2'

      it 'should compile nested collections', ->
        @compiled.nest.collection.should.be.an 'Array'
        @compiled.nest.collection[0].should.equal 'nested collection value 1'
        @compiled.nest.collection[1].should.equal 'nested collection value 2'

    describe 'maps', ->
      it 'should not indlue empty maps', ->
        expect(@compiled.empty_map).to.be.undefined

      it 'should compile the map', ->
        @compiled.map.should.be.an 'Object'
        @compiled.map['map_value_1'].should.equal 'map value 1'
        @compiled.map['map_value_2'].should.equal 'map value 2'

      it 'should compile nested maps', ->
        @compiled.nest.map.should.be.an 'Object'
        @compiled.nest.map['nested_map_value_1'].should.equal 'nested map value 1'
        @compiled.nest.map['nested_map_value_2'].should.equal 'nested map value 2'

