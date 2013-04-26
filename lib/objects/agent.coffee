TinCanObject = require '../tin-can-object'
Util = require '../util'

class Agent extends TinCanObject

  @of_type 'Agent'

  # Override TinCanObject name
  @named: (name) ->
    @agentName = name
    this

  @mbox_from: (fn) -> @mbox_as fn
  @mbox_as: (mbox) ->
    @mbox = mbox
    this

  @complie: (event) ->
    agent = super.complie(event)
    agent.name = Util.callOrReturn(this, @agentName, event)
    agent.mbox = Util.callOrReturn(this, @mbox, event)

module.exports = Agent
