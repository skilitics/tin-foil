TinCanObject = require '../tin-can-object'
Util = require '../util'

class Agent extends TinCanObject

  @of_type 'Agent'

  # Override TinCanObject name
  @name_from: (fn) -> @named fn
  @named: (name) ->
    @name = name
    this

  @mbox_from: (fn) -> @mbox_as fn
  @mbox_as: (mbox) ->
    @mbox = mbox
    this

  @compile: (event) ->
    agent = super(event)
    agent.name = Util.callOrReturn(this, @name, event)
    agent.mbox = Util.callOrReturn(this, @mbox, event)
    agent

module.exports = Agent
