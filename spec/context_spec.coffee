Context = require '../lib/context'
context = require './behaviours/context'

describe 'Context', ->
  before ->
    @e =
      registration: '1234-5678'
      instructor: 'Steve'
      team: 'Sam'
      revision: '1.3.4.0'
      platform: 'Flash Player' # Platform is a {}
      language: 'en-US',
      parent: 'some-parent'
      group: 'some-group'

  describe 'Fluent API', ->
    beforeEach -> @CourseContext = Context.extend()

    describe 'registration_from', ->
      beforeEach -> @r = @CourseContext.registration_from @e.registration
      it 'should set "registration"', -> @r.compile().registration.should.equal @e.registration
      xit 'should be chainable', -> @r.should.equal @CourseContext

    describe 'registered_as', ->
      beforeEach -> @r = @CourseContext.registered_as @e.registration
      it 'should set "registration"', -> @r.compile().registration.should.equal @e.registration
      xit 'should be chainable', -> @r.should.equal @CourseContext

    xdescribe 'instructor_from', ->
      beforeEach -> @r = @CourseContext.instructor_from @e.instructor
      it 'should set "instructor"', -> @r.compile().instructor.should.equal @e.instructor
      it 'should be chainable', -> @r.should.equal @CourseContext

    xdescribe 'instructed_as', ->
      beforeEach -> @r = @CourseContext.instructed_as @e.instructor
      it 'should set "instructor"', -> @r.compile().instructor.should.equal @e.instructor
      it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'teamed_as', ->
      beforeEach -> @r = @CourseContext.teamed_as @e.team
      it 'should set "team"', -> @r.compile().team.should.equal @e.team
      xit 'should be chainable', -> @r.should.equal @CourseContext

    describe 'team_from', ->
      beforeEach -> @r = @CourseContext.team_from @e.team
      it 'should set "team"', -> @r.compile().team.should.equal @e.team
      xit 'should be chainable', -> @r.should.equal @CourseContext

    xdescribe 'contextActivities', ->
      describe 'parented_by', ->
        beforeEach -> @r = @CourseContext.parented_by @e.parent
        it 'should set "parent"', -> @r.parent.should.equal @e.parent
        it 'should be chainable', -> @r.should.equal @CourseContext

      describe 'parented_as', ->
        beforeEach -> @r = @CourseContext.parented_as @e.parent
        it 'should set "parent"', -> @r.parent.should.equal @e.parent
        it 'should be chainable', -> @r.should.equal @CourseContext

      describe 'grouped_by', ->
        beforeEach -> @r = @CourseContext.grouped_by @e.parent
        it 'should set "group"', -> @r.group.should.equal @e.parent
        it 'should be chainable', -> @r.should.equal @CourseContext

      describe 'grouped_as', ->
        beforeEach -> @r = @CourseContext.grouped_as @e.parent
        it 'should set "group"', -> @r.group.should.equal @e.parent
        it 'should be chainable', -> @r.should.equal @CourseContext

    describe 'revisioned_as', ->
      beforeEach -> @r = @CourseContext.revisioned_as @e.revision
      it 'should set "revision"', -> @r.compile().revision.should.equal @e.revision
      xit 'should be chainable', -> @r.should.equal @CourseContext

    describe 'platform_from', ->
      beforeEach -> @r = @CourseContext.platform_from @e.platform
      it 'should set "platform"', -> @r.compile().platform.should.equal @e.platform
      xit 'should be chainable', -> @r.should.equal @CourseContext

    describe 'language_from', ->
      beforeEach -> @r = @CourseContext.language_from @e.language
      it 'should set "language" "', -> @r.compile().language.should.equal @e.language
      xit 'should be chainable', -> @r.should.equal @CourseContext

  describe 'Compilation', ->

    describe 'with static values', ->
      before ->
        @CourseContext = Context.extend()
        @CourseContext
          .registered_as(@e.registration)
#          .instructed_as(@e.instructor)
          .teamed_as(@e.team)
          .revisioned_as(@e.revision)
          .platform_from(@e.platform)
          .language_from(@e.language)
#          .parented_as(@e.parent)
#          .grouped_as(@e.group)

        @r = @CourseContext.compile(@e)

      context.shouldComplie()

    describe 'with dynamic values', ->
      before ->
        @CourseContext = Context.extend()
        @CourseContext
          .registration_from((event) -> event.registration)
#          .instructed_by((event) -> event.instructor)
          .team_from((event) -> event.team)
          .revision_from((event) -> event.revision)
          .platform_from((event) -> event.platform)
          .language_from((event) -> event.language)
#          .parented_by((event) -> event.parent)
#          .grouped_by((event) -> event.group)

        @r = @CourseContext.compile(@e)

      context.shouldComplie()
