# Tin Foil

Thin Tin Can wrapper for statement generation

## Getting Started
Install the module with: `npm install tin-foil`

## Usage

Define your verbs, objects and contexts by extending Verb, TinCanObject and Context:

*CoffeeScript*

``` CoffeeScript
{ TinCanObject } = require 'tin-foil'

class SceneObject extends TinCanObject
  @of_type 'scene'
  @identified_by (event) -> "/activities/scene/#{event.scene.id}"
  @named_from (event) -> event.scene.title
```

*JavaScript*

``` JavaScript
var SceneObject = TinCanObject.extend()
    .of_type('scene')
    .identified_by(function (event) { return "/activities/scene/" + event.scene.id; })
    .named_from(function (event) { return event.scene.title; });
```

Then define your statements

``` CoffeeScript
{ TinFoilEvent } = require '../tin_foil/tin_foil_event'

class SceneEnteredEvent extends TinFoilEvent
  @as 'user', i: 'entered', a: 'scene', in: 'scenario'
```

or generate them on the fly

``` CoffeeScript
SceneEnteredEvent = Statement.as 'user', i: 'entered', a: 'scene', in: 'scenario'
```

## License
Copyright (c) 2013 Skilitix
Licensed under the MIT license.
