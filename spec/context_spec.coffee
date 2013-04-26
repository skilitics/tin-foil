Context = require '../lib/context'

describe 'Context', ->
  before ->
    @e =
      registration: '1234-5678'
      instructor: 'Steve'
      team: 'Sam'
      revision: '1.3.4.0'
      platform: 'Flash Player' # Platform is a {}
      language: 'en-US'

  describe 'Fluent API', ->
    beforeEach -> @CourseContext = Context.extend()

    describe 'registered_by', ->
      beforeEach -> @r = @CourseContext.registered_by @e.registration
      it 'should set "registration"', -> @r.registration.should.equal @e.registration
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'registered_as', ->
      beforeEach -> @r = @CourseContext.registered_as @e.registration
      it 'should set "registration"', -> @r.registration.should.equal @e.registration
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'instructed_by', ->
      beforeEach -> @r = @CourseContext.instructed_by @e.instructor
      it 'should set "instructor"', -> @r.instructor.should.equal @e.instructor
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'instructed_as', ->
      beforeEach -> @r = @CourseContext.instructed_as @e.instructor
      it 'should set "instructor"', -> @r.instructor.should.equal @e.instructor
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'teamed_with', ->
      beforeEach -> @r = @CourseContext.teamed_with @e.team
      it 'should set "team"', -> @r.team.should.equal @e.team
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'revisioned_as', ->
      beforeEach -> @r = @CourseContext.revisioned_as @e.revision
      it 'should set "revision"', -> @r.revision.should.equal @e.revision
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'platform_from', ->
      beforeEach -> @r = @CourseContext.platform_from @e.platform
      it 'should set "platform"', -> @r.platform.should.equal @e.platform
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'language_from', ->
      beforeEach -> @r = @CourseContext.language_from @e.language
      it 'should set "language" "', -> @r.language.should.equal @e.language
      it 'should be chainable', -> @r.should.equal @CourseContext

  describe 'Compilation', ->

    describe 'with static values', ->
      before ->
        @CourseContext = Context.extend()
        @CourseContext
          .registered_as(@e.registration)
          .instructed_as(@e.instructor)
          .teamed_with(@e.team)
          .revisioned_as(@e.revision)
          .platform_from(@e.platform)
          .language_from(@e.language)

        @r = @CourseContext.compile(@e)

      it 'should contain the "registration"', -> @r.registration.should.equal @e.registration
      it 'should contain the "instructor"', -> @r.instructor.should.equal @e.instructor
      it 'should contain the "team"', -> @r.team.should.equal @e.team
      it 'should contain the "contextActivities"...'
      it 'should contain the "revision"', -> @r.revision.should.equal @e.revision
      it 'should contain the "platform"', -> @r.platform.should.equal @e.platform
      it 'should contain the "language"', -> @r.language.should.equal @e.language
      it 'should contain the "Extensions"...'

    describe 'with dynamic values', ->
      before ->
        @CourseContext = Context.extend()
        @CourseContext
          .registered_by((event) -> event.registration)
          .instructed_by((event) -> event.instructor)
          .teamed_with((event) -> event.team)
          .revisioned_by((event) -> event.revision)
          .platform_from((event) -> event.platform)
          .language_from((event) -> event.language)

        @r = @CourseContext.compile(@e)

      it 'should contain the "registration"', -> @r.registration.should.equal @e.registration
      it 'should contain the "instructor"', -> @r.instructor.should.equal @e.instructor
      it 'should contain the "team"', -> @r.team.should.equal @e.team
      it 'should contain the "contextActivities"...'
      it 'should contain the "revision"', -> @r.revision.should.equal @e.revision
      it 'should contain the "platform"', -> @r.platform.should.equal @e.platform
      it 'should contain the "language"', -> @r.language.should.equal @e.language
      it 'should contain the "Extensions"...'
