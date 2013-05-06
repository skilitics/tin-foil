InverseFunctionalIdentifer = require '../lib/inverse-functional-identifer'
shouldBehaveLike = require './behaviours/should-behave-like'

describe 'Inverse Functional Identifier', ->

  beforeEach -> @ifi = InverseFunctionalIdentifer.extend()

  shouldBehaveLike.inverseFunctionalIdentifier 'ifi'