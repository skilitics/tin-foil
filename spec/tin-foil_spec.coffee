TinFoil = require '../lib/tin-foil'
TinFoilCollection = require '../lib/tin-foil-collection'
TinFoilMap = require '../lib/tin-foil-map'

should = require('chai').should()
expect = require('chai').expect

describe 'TinFoil', ->

  beforeEach -> @Base = TinFoil.extend()

  describe 'setting definition default values', ->

    it 'should allow setting static definition default', ->
      @Base.set 'property', 'a-static-value'
      @Base.definition('property').defaultValue.should.equal 'a-static-value'

    it 'should allow setting a definition with the "to" option', ->
      @Base.set 'property', to: 'a-static-value'
      @Base.definition('property').defaultValue.should.equal 'a-static-value'

    it 'should allow setting the definition type', ->
      @Base.set 'property', to: 'a-static-value', as: String
      @Base.definition('property').type.should.equal String

    it 'should allow overriding a definition default', ->
      @Base.set 'property', to: 'a-static-value'
      @Base.set 'property', to: 'an-overidden-static-value'
      @Base.definition('property').defaultValue.should.equal 'an-overidden-static-value'

    it 'should allow setting dynamic definition defaults', ->
      @Base.set 'property', to: -> 'a-dynamic-value'
      @Base.definition('property').defaultValue().should.equal 'a-dynamic-value'

    it 'should not override the base definition default', ->
      @Base.set 'base', to: 'base'
      @Extended = @Base.extend()
      @Extended.set 'base', to: 'extended'
      @Extended.definition('base').defaultValue.should.equal 'extended'
      @Base.definition('base').defaultValue.should.equal 'base'

    it 'should throw an error it no value or options are supplied', ->
      (=> @Base.set 'property').should.throw 'You must provide a value or set of options when setting a definition'

    it 'should be chainable', ->
      @Base.set('objectType', to: 'a-static-value').should.equal @Base

  describe 'getting definitions', ->

    it 'should allow getting a definition', ->
      @Base.set 'property', to: 'a-static-value'
      @Base.definition('property').defaultValue.should.equal 'a-static-value'

    it 'should throw an error if the definition does not exist', ->
      (=> @Base.definition('does-not-exist')).should.throw 'Property [does-not-exist] has not been defined'

    it 'should allow getting a parent definition', ->
      @Base.set 'base', to: 'base'
      @Extended = @Base.extend()
      @Extended.set 'extended', to: 'extended'
      @Extended.definition('base').defaultValue.should.equal 'base'
      @Extended.definition('extended').defaultValue.should.equal 'extended'

    it 'should not be child definitions', ->
      @Base.set 'base', to: 'base'
      @Extended = @Base.extend()
      @Extended.set 'extended', to: 'extended'
      (=> @Base.definition('extended')).should.throw 'Property [extended] has not been defined'

  describe 'adding definitions', ->

    it 'should allow adding definitions', ->
      @Base.define 'property'
      (=> @Base.definition('property')).should.not.throw()

    it 'should allow adding typed definitions', ->
      @Base.define 'property', as: String
      @Base.definition('property').type.should.equal String

    it 'should allow adding aliases', ->
      @Base.define 'property', aliases: ['add_property', 'set_property']
      expect(@Base.add_property).to.not.be.undefined
      expect(@Base.set_property).to.not.be.undefined

    it 'should allow adding aliases via "with_aliases"', ->
      @Base.define 'property', with_aliases: ['add_property', 'set_property']
      expect(@Base.add_property).to.not.be.undefined
      expect(@Base.set_property).to.not.be.undefined

    it 'should allow adding a single aliases via "with_alias"', ->
      @Base.define 'property', with_alias: 'add_property'
      expect(@Base.add_property).to.not.be.undefined

    it 'should allow setting a default value', ->
      @Base.define 'property', defaultValue: 'default'
      @Base.definition('property').defaultValue.should.equal 'default'

    it 'should allow setting a default value via "default_as"', ->
      @Base.define 'property', default_as: 'default'
      @Base.definition('property').defaultValue.should.equal 'default'

    it 'should be chainable', ->
      @Base.define('property').should.equal @Base

  describe 'aliases', ->

    beforeEach ->
      @Base.define 'property', with_alias: 'set_property'

    it 'should be able to set static definition default', ->
      @Base.set_property 'a-static-value'
      @Base.definition('property').defaultValue.should.equal 'a-static-value'

    it 'should be able to set dynamic definition default', ->
      @Base.set_property -> 'a-dynamic-value'
      @Base.definition('property').defaultValue.should.be.an.instanceOf Function

    it 'should not override base definition default', ->
      @Base.set_property 'a-static-value'
      @Extended = @Base.extend()
      @Extended.set_property 'an-extended-value'
      @Base.definition('property').defaultValue.should.equal 'a-static-value'
      @Extended.definition('property').defaultValue.should.equal 'an-extended-value'

    it 'should be able to have a prefix', ->
      @Base.define 'another_property', with_alias: 'another_set_property', with_prefix: 'prefix_'
      @Base.prefix_another_set_property 'a-static-value'
      @Base.definition('another_property').defaultValue.should.equal 'a-static-value'

  describe 'fluent define', ->

    it 'should be able to set definitions', ->
      @Base.define 'property', as: String, with_aliases: ['add_property', 'set_property'], default_as: 'default'
      definition = @Base.definition('property')
      definition.type.should.equal String
      expect(@Base.add_property).to.not.be.undefined
      expect(@Base.set_property).to.not.be.undefined
      definition.defaultValue.should.equal 'default'
      definition.defaultValue.should.equal 'default'

    it 'should be chainable', ->
      @Base.define('property', as: String).should.equal @Base

  xdescribe 'nested definitions', ->

    beforeEach ->
      @SecondNest = TinFoil.extend()
      @SecondNest.define 'second_nest_property', as: String, with_alias: 'set_second_nest_property'

      @Nest = TinFoil.extend()
      @Nest.define 'nested_property', as: String, with_alias: 'set_nested_property'
      @Nest.define 'second_nest', as: @SecondNest, with_prefix: 'second_nest_'

      @Base.define 'nest', as: @Nest

    it 'should be able to be set', ->
      @Base.definition('nest').type.__super__.constructor.should.equal @Nest
      @Nest.definition('second_nest').type.__super__.constructor.should.equal @SecondNest

    it 'should map the nested definition aliases', ->
      @Base.set_nested_property.should.equal @Nest.set_nested_property
      @Base.second_nest_set_second_nest_property.should.equal @SecondNest.set_second_nest_property

    it 'should be able to set static defaults on nested definitions', ->
      @Base.set_nested_property 'nested-value'
      @Base.definition('nest').type
        .definition('nested_property').defaultValue.should.equal 'nested-value'
      @Base.second_nest_set_second_nest_property 'second-nested-value'
      @Base.definition('nest').type
        .definition('nested_property').type
        .definition('second_nest').defaultValue.should.equal 'second-nested-value'

    it 'should be able to set dynamic defaults on nested definitions', ->
      @Base.set_nested_property -> 'a-dynamic-value'
      @Base.second_nest_set_second_nest_property -> 'a-nested-dynamic-value'
      @Base.definition('nest').type
        .definition('nested_property').defaultValue().should.equal 'a-dynamic-value'
      @Base.definition('nest').type
        .definition('nested_property').type
        .definition('second_nest').defaultValue().should.equal 'a-nested-dynamic-value'

    it 'should be able to prefix the nested definitions', ->
      @Base.define 'prefixed_nest', as: @Nest, with_prefix: 'nest_'
      @Base.nest_add_nested_alias.should.not.be.undefined
      @Base.nest_add_nested_alias.should.equal @Nest.add_nested_alias

  describe 'collections', ->

    beforeEach ->
      @Base.define 'collection', as: TinFoilCollection, with_alias: 'add_to_collection'

    it 'should map the collection aliases', ->
      @Base.add_to_collection.should.not.be.undefined

    it 'should allow adding static properties to the collection', ->
      @Base.add_to_collection 'some-value'
      @Base.add_to_collection 'another-value'
      @Base.definition('collection').defaultValue.get(0).should.equal 'some-value'
      @Base.definition('collection').defaultValue.get(1).should.equal 'another-value'

    it 'should allow adding dynamic properties to the collection', ->
      @Base.add_to_collection -> 'some-value'
      @Base.add_to_collection -> 'another-value'
      @Base.definition('collection').defaultValue.get(0)().should.equal 'some-value'
      @Base.definition('collection').defaultValue.get(1)().should.equal 'another-value'

  describe 'maps', ->

    beforeEach ->
      @Base.define 'map', as: TinFoilMap, with_alias: 'add_to_map'

    it 'should map the map aliases', ->
      @Base.add_to_map.should.not.be.undefined

    it 'should allow adding static properties to the map', ->
      @Base.add_to_map 'some-key', 'some-value'
      @Base.add_to_map 'another-key', 'another-value'
      @Base.compile().map['some-key'].should.equal 'some-value'
      @Base.compile().map['another-key'].should.equal 'another-value'

    it 'should allow adding dynamic properties to the map', ->
      @Base.add_to_map 'some-key', -> 'some-value'
      @Base.add_to_map 'another-key', -> 'another-value'
      @Base.compile().map['some-key'].should.equal 'some-value'
      @Base.compile().map['another-key'].should.equal 'another-value'

  describe 'mixins', ->

    beforeEach ->
      @Tin = TinFoil.extend()
      @Tin.set 'tin_prop', to: 'tin-value'

      @Mix = TinFoil.extend()
      @Mix.define 'mixed', as: String, with_alias: 'mixed_in'
      @Mix.define 'tin', as: @Tin
      @Base.define 'keep', as: String, with_alias: 'keep_me'
      @Base.mixin @Mix

    it 'should mix in the definitions', ->
      @Base.definition('mixed').should.not.be.undefined

    it 'should map the mixin aliases', ->
      @Base.mixed_in.should.not.be.undefined

    it 'should still have the base definitions', ->
      @Base.definition('keep').should.not.be.undefined

    it 'should still have the base aliases', ->
      @Base.keep_me.should.not.be.undefined

    it 'should mix in nested definitions', ->
      @Base.definition('tin').type.definition('tin_prop').defaultValue.should.equal 'tin-value'


  describe 'extend', ->

    beforeEach ->
      @Base.define 'extension', as: String, with_alias: 'my_extension', default_as: 'original-value'
      @Extended = @Base.extend()

    it 'should extend the object', ->
      @Extended.prototype.should.be.instanceOf @Base

    it 'should still have the base definitions', ->
      @Extended.definition('extension').should.to.not.be.undefined

    it 'should still have the aliases', ->
      @Extended.my_extension.should.not.be.undefined

    it 'should not alter base properties', ->
      @Extended.my_extension 'new-value'
      @Base.definition('extension').defaultValue.should.equal 'original-value'

  describe 'compilation', ->

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

      @Nest = TinFoil.extend()
      @Nest.set 'nested', to: (event) -> event.nest.nested
      @Nest.define 'map', as: TinFoilMap, with_alias: 'add_to_map'
      @Nest.define 'collection', as: TinFoilCollection, with_alias: 'add_to_collection'

      @Mix = TinFoil.extend()
      @Mix.set 'mix', to: (event) -> event.mix

      @Base.set 'property_1', 'property1'
      @Base.set 'property_2', (event) -> event.property2
      @Base.define 'nest', as: @Nest, with_prefix: 'nest_'
      @Base.define 'empty_collection', as: TinFoilCollection
      @Base.define 'collection', as: TinFoilCollection, with_alias: 'add_to_collection'
      @Base.define 'empty_map', as: TinFoilMap
      @Base.define 'map', as: TinFoilMap, with_alias: 'add_to_map'
      @Base.mixin @Mix

      @Base.add_to_collection 'collection value 1'
      @Base.add_to_collection (event) -> event.collectionValue2
#      @Base.nest_add_to_collection 'nested collection value 1'
#      @Base.nest_add_to_collection (event) -> event.nestedCollectionValue2

      @Base.add_to_map 'map_value_1', 'map value 1'
      @Base.add_to_map 'map_value_2', (event) -> event.mapValue2
#      @Base.nest_add_to_map 'nested_map_value_1', 'nested map value 1'
#      @Base.nest_add_to_map 'nested_map_value_2', (event) -> event.nestedMapValue2

      @compiled = @Base.compile @event

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

