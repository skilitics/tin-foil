InteractionActivities = require '../lib/interaction-activities'
shouldBehaveLike = require './behaviours/should-behave-like'

describe 'Interaction Activities', ->

  beforeEach -> @interactionActivities = InteractionActivities.extend()

  shouldBehaveLike.interactionActivities 'interactionActivities'
