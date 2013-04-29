exports.shouldComplie = ->
  it 'should contain the "name"', -> @r.name.should.equal @e.name
  it 'should contain the "mbox"', -> @r.mbox.should.equal @e.email