exports.shouldCompile = ->
  it 'should set the "actor"', ->
    compiled = JSON.stringify(@r.actor)
    original = JSON.stringify(@user.compile())
    compiled.should.equal original

  it 'should set the "verb"', ->
    compiled = JSON.stringify(@r.verb)
    original = JSON.stringify(@verb.compile())
    compiled.should.equal original

  it 'should set the "object"', ->
    JSON.stringify(@r.object).should.equal JSON.stringify(@scene.compile @event)
    compiled = JSON.stringify(@r.object)
    original = JSON.stringify(@scene.compile())
    compiled.should.equal original

  it 'should set the "context"', ->
    compiled = JSON.stringify(@r.context)
    original = JSON.stringify(@scenario.compile())
    compiled.should.equal original

  it 'should set the "result"', ->
    compiled = JSON.stringify(@r.result)
    original = JSON.stringify(@result.compile())
    compiled.should.equal original

  it 'should set the "timestamp"', ->
    @r.timestamp.should.equal @event.timestamp