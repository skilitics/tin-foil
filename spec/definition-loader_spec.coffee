DefinitionLoader = require '../lib/definition-loader'

describe 'DefinitionLoader', ->

  beforeEach ->
    @definitionLoader = new DefinitionLoader

  describe 'given a context', ->
    beforeEach -> @definitionLoader.setLoadContext(this)

    it 'should be able to load a definition', ->
      @aDefinition = {}
      @definitionLoader.findDefinition('aDefinition').should.equal @aDefinition

  describe 'given a class/function', ->

    it 'should return the class/function', ->
      aDefinition = ->
      @definitionLoader.findDefinition(aDefinition).should.equal aDefinition

  describe 'given null', ->

    it 'should return a dummy object with a complie method', ->
      @definitionLoader.findDefinition().compile.should.be.a 'function'