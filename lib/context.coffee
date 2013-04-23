Module = require './module'
Extensions = require './extensions'

class Context extends Module

  @mixin Extensions

  # Fluent API
  @registered_by: (registration) -> @registration = registration
  @instructed_by: (instructor) -> @instructor = instructor
  @teamed_with: (team) -> @team = team

  # contextActivities
  @parented_by: (parent) -> @constructor.parent = parent
  @grouped_by: (group) -> @constructor.group = group

  @revisioned_as: (revision) -> @revision = revision
  @platform_from: (platform) -> @platform = platform
  @language_from: (language) -> @language = language

  # Compliation
  @compileRegistration: (event) -> @registration
  @compileInstructor: (event) -> @instructor
  @compileTeam: (event) -> @team

  @compileParent: (event) ->
    parent = @constructor.parent or ''
    if parent instanceof Function then parent.call(this, event) else event

  @compileGrouping: (event) -> this

  @compileRevision: (event) -> @revision
  @compilePlatform: (event) -> @platform
  @compileLanguage: (event) -> @language

  @compile: (event) ->
    registration: @compileRegistration(event)
    instructor: @compileInstructor(event)
    team: @compileTeam(event)
    contextActivities:
      parent: id: @compileParent(event)
      grouping: id: @compileGrouping(event)
    revision: @compileRevision(event)
    platform: @compilePlatform(event)
    language: @compileLanguage(event)
    extensions: @compileExtensions(event)

module.exports = Context
