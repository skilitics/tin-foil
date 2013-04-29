Module = require './module'
Extensions = require './extensions'
Util = require './util'

class Context extends Module

  @mixin Extensions

  # Fluent API
  @registered_by: (fn) -> @registered_as fn
  @registered_as: (registration) ->
    @registration = registration
    this

  @instructed_by: (fn) -> @instructed_as fn
  @instructed_as: (instructor) ->
    @instructor = instructor
    this

  @teamed_with: (team) ->
    @team = team
    this

  # contextActivities
  @parented_by: (fn) -> @parented_as fn
  @parented_as: (parent) ->
    @parent = parent
    this

  @grouped_by: (fn) -> @grouped_as fn
  @grouped_as: (group) ->
    @group = group
    this

  @revisioned_as: (fn) -> @revisioned_by fn
  @revisioned_by: (revision) ->
    @revision = revision
    this

  @platform_from: (fn) -> @platform_as fn
  @platform_as: (platform) ->
    @platform = platform
    this

  @language_from: (fn) -> @language_as fn
  @language_as: (language) ->
    @language = language
    this

  # Compliation
  @compile: (event) ->
    registration: Util.callOrReturn(this, @registration, event)
    instructor: Util.callOrReturn(this, @instructor, event)
    team: Util.callOrReturn(this, @team, event)
    contextActivities:
      parent: id: Util.callOrReturn(this, @parent, event)
      grouping: id: Util.callOrReturn(this, @group, event)
    revision: Util.callOrReturn(this, @revision, event)
    platform: Util.callOrReturn(this, @platform, event)
    language: Util.callOrReturn(this, @language, event)
    extensions: @compileExtensions(event)

module.exports = Context
