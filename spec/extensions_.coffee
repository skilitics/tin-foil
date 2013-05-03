Extensions = require '../lib/extensions'
props = require './behaviours/props'

describe 'Extensions', ->

  beforeEach ->


    class @MyClass extends TinFoilObject
      @mixin Extensions

      @extends_with 'myExtension', 'myValue'
      @extends_with 'myOtherExtension', 'myOtherValue'
      @extends_with 'myDynamicExtension', (event) -> "My dynamic #{event.value}"

  describe 'Fluent API', ->
    describe 'extends_with', ->
      it 'should add the extension', ->
        @MyClass.extensions['myExtension'].should.equal 'myValue'

      it 'should allow multiple extensions', ->
        @MyClass.extensions['myExtension'].should.equal 'myValue'
        @MyClass.extensions['myOtherExtension'].should.equal 'myOtherValue'
        @MyClass.extensions['myDynamicExtension'].should.be.a 'function'

      it 'should be chainable', ->
        @MyClass.extends_with().should.equal @MyClass

  describe 'Compliation', ->

    beforeEach ->
      @r = @MyClass.compileExtensions value: 'value'

    it 'should contain the extensions', ->
      @r.myExtension.should.equal 'myValue'
      @r.myOtherExtension.should.equal 'myOtherValue'

    it 'should contain the dynamic extensions', ->
      @r.myDynamicExtension.should.equal 'My dynamic value'
