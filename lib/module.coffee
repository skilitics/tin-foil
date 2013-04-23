# This is taken from Spine. It is what makes it possible (or at least simpler) to extend or instantiate objects in
# JavaScript, vs CoffeeScript.

moduleKeywords = ['mixin', 'extend']

class Module

  @mixin: (obj) ->
    throw new Error('mixin(obj) requires obj') unless obj
    for key, value of obj when key not in moduleKeywords
      @[key] = value
#    obj.extended?.apply(this)
    this

  @extend: (statics) ->
    class Result extends this
    Result.mixin(statics) if statics
    Result

module.exports = Module
