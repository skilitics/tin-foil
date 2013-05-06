require '../assertions'
should = require('chai').should()

a = (word) -> if (word[0] in ['a', 'e', 'i', 'o', 'u']) then 'an' else 'a'

exports.shouldHaveProp = (obj, prop) ->
  it "should have #{a(prop)} '#{prop}' property", ->
    @[obj].should.have.prop prop

exports.shouldHaveAlias = (obj, prop, alias) ->
  it "should have #{a(alias)} '#{alias}' alias", ->
    @[obj].get(prop).should.have.alias alias
