require '../assertions'
should = require('chai').should()

a = (word) -> if (word[0] in ['a', 'e', 'i', 'o', 'u']) then 'an' else 'a'

exports.shouldHaveDefinition = (obj, definition) ->
  it "should have #{a(definition)} '#{definition}' definition", ->
    @[obj].should.have.definition definition

exports.shouldHaveAlias = (obj, definition, alias) ->
  it "should have #{a(alias)} '#{alias}' alias", ->
    @[obj].definition(definition).should.have.alias alias
