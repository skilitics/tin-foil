TinFoilObject = require '../lib/tin-foil-object'

describe 'TinFoilObject', ->

  beforeEach ->
    @base = TinFoilObject.extend()
    @event =
      id: '1234'
      objectType: 'a-dynamic-value'
      name: 'name-property'

  describe 'Setting properties', ->

    it 'should allow setting static properties', ->
      @base.set 'objectType', to: 'a-static-value'
      @base.compile(@event).objectType.should.equal 'a-static-value'

    it 'should allow setting dynamic properties', ->
      @base.set 'objectType', to: (event) -> event.objectType
      @base.compile(@event).objectType.should.equal 'a-dynamic-value'

    it 'should be chainable', ->
      @base.set('objectType', to: 'a-static-value').should.equal @base

  describe 'Adding properties', ->
    beforeEach ->
      @base.add 'name', String, 'named', 'name_from'

    it 'should allow setting added properties to static values', ->
      @base.named 'name-property'
      @base.compile(@event).name.should.equal 'name-property'

    it 'should allow setting added properties to dynamic values', ->
      @base.name_from (event) -> event.name
      @base.compile(@event).name.should.equal 'name-property'

    it 'should be chainable', ->
      @base.add('name', String, 'named', 'name_from').should.equal @base

  describe 'Extensions', ->
    beforeEach ->
      @extension = TinFoilObject.extend()

    describe 'Setting extended properties', ->

      it 'should allow setting extended static properties', ->
        @extension.set 'objectType', to: 'extended-type'
        @base.add 'extension', @extension
        @base.compile(@event).extension.objectType.should.equal 'extended-type'

      it 'should allow setting extended dynamic properties', ->
        @extension.set 'objectType', to: (event) -> event.objectType
        @base.add 'extension', @extension
        @base.compile(@event).extension.objectType.should.equal 'a-dynamic-value'

    describe 'Adding extended properties', ->
      beforeEach ->
        @extension.add 'name', String, 'named', 'name_from'
        @base.add 'extension', @extension

      it 'should allow setting added extended properties to static values', ->
        @base.extension_named 'extended-name-property'
        @base.compile(@event).extension.name.should.equal 'extended-name-property'

      it 'should allow setting added extended properties to dynamic values', ->
        @base.extension_name_from (event) -> event.name
        @base.compile(@event).extension.name.should.equal @event.name

      it 'should be chainable', ->
        @base.extension_named('extended-name-property').should.equal @base
