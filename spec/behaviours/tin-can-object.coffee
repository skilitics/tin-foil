exports.shouldCompile = ->
    it 'should contain the "id"', -> @r.id.should.equal @e.id
    it 'should contain the "objectType"', -> @r.objectType.should.equal @e.type
    it 'should contain the "definition.name"', -> @r.definition.name['en-US'].should.equal @e.name
    it 'should contain the "definition.description"', -> @r.definition.description['en-US'].should.equal @e.description