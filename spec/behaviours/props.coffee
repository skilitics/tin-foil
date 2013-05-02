require '../assertions'
{ should } = require 'chai'

exports.shouldHaveProp = (obj, prop) ->
  it "should have a '#{prop}' property", ->
    @[obj].should.have.prop prop

exports.shouldHaveAlias = (obj, prop, alias) ->
  vowels = ['a', 'e', 'i', 'o', 'u']
  a = if (alias[0] in vowels) then 'an' else 'a'

  it "should have #{a} '#{alias}' alias", ->
    @[obj].prop(prop).should.have.alias alias
