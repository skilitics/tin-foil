exports.shouldComplie = ->
  it 'should contain the "registration"', -> @r.registration.should.equal @e.registration
  it 'should contain the "instructor"', -> @r.instructor.should.equal @e.instructor
  it 'should contain the "team"', -> @r.team.should.equal @e.team
  it 'should contain the "contextActivities.parent.id"', -> @r.contextActivities.parent.id.should.equal @e.parent
  it 'should contain the "contextActivities.grouping.id"', -> @r.contextActivities.grouping.id.should.equal @e.group
  it 'should contain the "revision"', -> @r.revision.should.equal @e.revision
  it 'should contain the "platform"', -> @r.platform.should.equal @e.platform
  it 'should contain the "language"', -> @r.language.should.equal @e.language
  it 'should contain the "Extensions"...'