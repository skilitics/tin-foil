TinFoil = require '../lib/tin-foil'
TinFoilCollection = require '../lib/tin-foil-collection'
TinFoilMap = require '../lib/tin-foil-map'

should = require('chai').should()
expect = require('chai').expect

describe 'TinFoil', ->

  beforeEach -> @Base = TinFoil.extend()

  describe 'definitions', ->

    beforeEach ->
      @Base.set 'property_1', to: 'property 1'
      @Base.set 'property_2', to: 'property 2'
      @Extended = @Base.extend()
      @Extended.set 'property_3', to: 'property 3'

    it 'should return all inherited definitions', ->
      @Extended.definitions()['property_1'].defaultValue.should.equal 'property 1'
      @Extended.definitions()['property_2'].defaultValue.should.equal 'property 2'
      @Extended.definitions()['property_3'].defaultValue.should.equal 'property 3'

    it 'should return the overridden definitions', ->
      @Extended.set 'property_2', to: 'overriden property'

      @Extended.definitions()['property_1'].defaultValue.should.equal 'property 1'
      @Extended.definitions()['property_2'].defaultValue.should.equal 'overriden property'
      @Extended.definitions()['property_3'].defaultValue.should.equal 'property 3'

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
      @Base.add_property.should.not.be.undefined
      @Base.set_property.should.not.be.undefined

    it 'should allow adding aliases via "with_aliases"', ->
      @Base.define 'property', with_aliases: ['add_property', 'set_property']
      @Base.add_property.should.not.be.undefined
      @Base.set_property.should.not.be.undefined

    it 'should allow adding a single aliases via "with_alias"', ->
      @Base.define 'property', with_alias: 'add_property'
      @Base.add_property.should.not.be.undefined

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
      @Base.add_property.should.not.be.undefined
      @Base.set_property.should.not.be.undefined
      definition.defaultValue.should.equal 'default'
      definition.defaultValue.should.equal 'default'

    it 'should be chainable', ->
      @Base.define('property', as: String).should.equal @Base

  describe 'nested definitions', ->

    beforeEach ->
      @Activity = require '../lib/activity'
      @ActivityDefinition = require '../lib/activity-definition'

      @Base.define 'activity', as: @Activity, with_prefix: 'activity_'

    it 'should be able to be set', ->
      @Base.definition('activity').should.not.be.undefined
      @Activity.definition('definition').should.not.be.undefined
      @Base.definition('activity').type.definition('definition').should.not.be.undefined

    it 'should map the nested definition aliases', ->
      @Base.activity_identified_as.should.not.be.undefined
      @Base.activity_identify_from.should.not.be.undefined
      @Base.activity_definition_named.should.not.be.undefined
      @Base.activity_definition_name_from.should.not.be.undefined
      @Base.activity_definition_with_extension.should.not.be.undefined # TinFoilMap
      @Base.activity_definition_add_choice.should.not.be.undefined # TinFoilCollection

    it 'should be able to set static defaults on nested definitions', ->
      @Base.activity_identified_as '/activities/scene/123'
      @Base.definition('activity').type
        .definition('id').defaultValue.should.equal '/activities/scene/123'
      @Base.activity_definition_named 'scene'
      @Base.definition('activity').type
        .definition('definition').type
        .definition('name').defaultValue.should.equal 'scene'

    it 'should be able to set dynamic defaults on nested definitions', ->
      @Base.activity_identify_from (data) -> "/activities/scene/#{data.scene.id}"
      @Base.definition('activity').type
        .definition('id').defaultValue(scene: id: '123').should.equal '/activities/scene/123'
      @Base.activity_definition_description_from (data) -> data.scene.title
      @Base.definition('activity').type
        .definition('definition').type
        .definition('description').defaultValue(scene: title: 'Zombies attack!').should.equal 'Zombies attack!'

    it 'should be able to add to nested maps', ->
      @Base.activity_definition_with_extension 'urn:organisation-id', '123'
      @Base.definition('activity').type
        .definition('definition').type
        .definition('extensions').defaultValue.get('urn:organisation-id').should.equal '123'
      @Base.activity_definition_with_extension 'urn:tenant-id', (data) -> data.tenantId
      @Base.definition('activity').type
        .definition('definition').type
        .definition('extensions').defaultValue.get('urn:tenant-id')(tenantId: '123').should.equal '123'

    it 'should be able to add to nested collections', ->
      @Base.activity_definition_add_choice 'a'
      @Base.activity_definition_add_choice (data) -> data.choice
      @Base.definition('activity').type
        .definition('definition').type
        .definition('choices').defaultValue.get(0).should.equal 'a'
      @Base.definition('activity').type
        .definition('definition').type
        .definition('choices').defaultValue.get(1)(choice: 'b').should.equal 'b'

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
      @Base.definition('map').defaultValue.get('some-key').should.equal 'some-value'
      @Base.definition('map').defaultValue.get('another-key').should.equal 'another-value'

    it 'should allow adding dynamic properties to the map', ->
      @Base.add_to_map 'some-key', -> 'some-value'
      @Base.add_to_map 'another-key', -> 'another-value'
      @Base.definition('map').defaultValue.get('some-key')().should.equal 'some-value'
      @Base.definition('map').defaultValue.get('another-key')().should.equal 'another-value'

    it 'should not alter the base', ->
      expect(=> @Base.definition('map').defaultValue.get('some-key')).to.throw()

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

    it 'should instantiate new maps', ->
      @Mappable = TinFoil.extend()
      @Mappable.define 'map', as: TinFoilMap, with_alias: 'add_to_map'
      @Base.mixin @Mappable

      @Another = TinFoil.extend()
      @Another.mixin @Mappable

      @Base.add_to_map 'key', 'value 1'
      @Another.add_to_map 'key', 'value 2'

      @Base.definition('map').defaultValue.get('key').should.equal 'value 1'
      @Another.definition('map').defaultValue.get('key').should.equal 'value 2'

    it 'should instantiate new collections', ->
      @Collectable = TinFoil.extend()
      @Collectable.define 'collection', as: TinFoilCollection, with_alias: 'add_to_collection'
      @Base.mixin @Collectable

      @Another = TinFoil.extend()
      @Another.mixin @Collectable

      @Base.add_to_collection 'a'
      @Another.add_to_collection 'b'

      @Base.definition('collection').defaultValue.get(0).should.equal 'a'
      @Another.definition('collection').defaultValue.get(0).should.equal 'b'

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

    it 'should instantiate new maps', ->
      @Mappable = TinFoil.extend()
      @Mappable.define 'map', as: TinFoilMap, with_alias: 'add_to_map'
      @Base.define 'mappable', as: @Mappable

      @Another = TinFoil.extend()
      @Another.define 'mappable', as: @Mappable

      @Base.add_to_map 'key 1', 'base value 1'
      @Base.add_to_map 'key 2', 'base value 1'
      @Another.add_to_map 'key 1', 'another value 2'
      @Another.add_to_map 'key 2', 'another value 2'

      @Base.definition('mappable').type
        .definition('map').defaultValue.should.not.equal @Another.definition('mappable').type.definition('map').defaultValue

      @Base.definition('mappable').type
        .definition('map').defaultValue.get('key 1').should.equal 'base value 1'
      @Base.definition('mappable').type
        .definition('map').defaultValue.get('key 2').should.equal 'base value 2'
      @Another.definition('mappable').type
        .definition('map').defaultValue.get('key 1').should.equal 'another value 1'
      @Another.definition('mappable').type
        .definition('map').defaultValue.get('key 2').should.equal 'another value 2'

    it 'should instantiate new collections', ->
      @Collectable = TinFoil.extend()
      @Collectable.define 'collection', as: TinFoilCollection, with_alias: 'add_to_collection'
      @Base.define 'collectable', as: @Collectable

      @Another = TinFoil.extend()
      @Another.define 'collectable', as: @Collectable

      @Base.add_to_collection 'base a'
      @Base.add_to_collection 'base b'
      @Another.add_to_collection 'another a'
      @Another.add_to_collection 'another b'

      @Base.definition('collectable').type
        .definition('collection').defaultValue.should.not.equal @Another.definition('collectable').type.definition('collection').defaultValue

      @Base.definition('collectable').type
        .definition('collection').defaultValue.get(0).should.equal 'base a'
      @Base.definition('collectable').type
        .definition('collection').defaultValue.get(1).should.equal 'base b'
      @Another.definition('collectable').type
        .definition('collection').defaultValue.get(0).should.equal 'another a'
      @Another.definition('collectable').type
        .definition('collection').defaultValue.get(2).should.equal 'another b'

  describe 'compilation', ->
    Activity = require '../lib/activity'

    beforeEach ->
      @data =
        tenantId: '4321-8765-dcba'
        scene:
          id: '1234-5678-abcd'
          title: 'When Zombies Attack'

      class @Scene extends Activity
        @identify_from (data) -> "http://skilitix.com/xapi/activities/scene/#{data.scene.id}"

        @definition_named 'en-US': 'Scene'
        @definition_description_from (data) -> 'en-US': data.scene.title
        @definition_typed_as 'http://skilitix.com/xapi/activities/node'

        @definition_with_extension 'urn:organisation-id', (data) -> data.tenantId
        @definition_with_extension 'urn:nothing', 'nowhere'

        @definition_interaction_type 'none'
        @definition_add_choice 'Jump out the window'
        @definition_add_choice 'Stay inside and play xBox'

        @define 'emptyMap', as: TinFoilMap, with_alias: 'add_to_empty_map'

      @Base.define 'scene', as: @Scene, with_prefix: 'scene_'

      @compiled = @Base.compile @data

    it 'should compile set properties', ->
      @compiled.scene.objectType.should.equal 'Activity'

    it 'should compile static properties', ->
      @compiled.scene.definition.name['en-US'].should.equal 'Scene'

    it 'should compile dynamic properties', ->
      @compiled.scene.id.should.equal 'http://skilitix.com/xapi/activities/scene/1234-5678-abcd'
      @compiled.scene.definition.description['en-US'].should.equal 'When Zombies Attack'

    it 'should compile nested properties', ->
      @compiled.scene.id.should.equal 'http://skilitix.com/xapi/activities/scene/1234-5678-abcd'

    it 'should compile mixed properties', ->
      @compiled.scene.definition.interactionType.should.equal 'none'

    it 'should not include properties with a value of "undefined"', ->
      expect(@compiled.scene.moreinfo).to.be.undefined

    describe 'collections', ->
      it 'should not include empty collections', ->
        expect(@compiled.scene.correctResponsePattern).to.be.undefined

      it 'should compile the collection', ->
        @compiled.scene.definition.choices.length.should.equal 2
        @compiled.scene.definition.choices[0].should.equal 'Jump out the window'
        @compiled.scene.definition.choices[1].should.equal 'Stay inside and play xBox'

    describe 'maps', ->
      it 'should not indlue empty maps', ->
        expect(@compiled.scene.emptyMap).to.be.undefined

      it 'should compile the map', ->
        expect(@compiled.scene.definition.extensions['urn:tenant-id']).to.be.undefined
        @compiled.scene.definition.extensions['urn:organisation-id'].should.equal '4321-8765-dcba'
        @compiled.scene.definition.extensions['urn:nothing'].should.equal 'nowhere'
