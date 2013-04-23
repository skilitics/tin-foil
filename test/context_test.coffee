Context = require '../lib/context'

describe 'Context', ->
  e =
    registration: '1234-5678'
    instructor: 'Steve'
    team: 'Sam'
    revision: '0.1.8'
    platform: 'Flash Player'
    language: 'en-US'

  before -> @customContext = Context.extend()

  describe 'Fluent API', ->
    it 'should set "registration" from "registered_by"', ->
      @customContext.registered_by e.registration
      @customContext.registration.should.equal e.registration

    it 'should set "instructor" from "instructed_by"', ->
      @customContext.instructed_by e.instructor
      @customContext.instructor.should.equal e.instructor

    it 'should set "team" from "teamed_with"', ->
      @customContext.teamed_with e.team
      @customContext.team.should.equal e.team

    it 'should set "contextActivities" from...'

    it 'should set "revision" from "revisioned_as"', ->
      @customContext.revisioned_as e.revision
      @customContext.revision.should.equal e.revision

    it 'should set "platform" from "platform_from"', ->
      @customContext.platform_from e.platform
      @customContext.platform.should.equal e.platform

    it 'should set "language" from "language_from"', ->
      @customContext.language_from e.language
      @customContext.language.should.equal e.language

    it 'should set "statement" from...'

    it 'should allow "extensions"', ->
      @customContext.extends_with.should.be.a('Function')

  describe 'Compilation', ->

    before -> @r = @customContext.compile(e)

    it 'should contain the "registration"', -> @r.registration.should.equal e.registration
    it 'should contain the "instructor"', -> @r.instructor.should.equal e.instructor
    it 'should contain the "team"', -> @r.team.should.equal e.team
    it 'should contain the "contextActivities"...'
    it 'should contain the "revision"', -> @r.revision.should.equal e.revision
    it 'should contain the "platform"', -> @r.platform.should.equal e.platform
    it 'should contain the "language"', -> @r.language.should.equal e.language
    it 'should contain the "Extensions"...'
