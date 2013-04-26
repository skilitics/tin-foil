exports.callOrReturn = (context, thing, params...) ->
  if thing instanceof Function
    thing.apply(context, params)
  else
    thing