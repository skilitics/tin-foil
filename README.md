# Tin Foil

Thin Tin Can wrapper for statement generation

## Getting Started
Install the module with: `npm install tin-foil`

## Usage

Define your verbs, objects and contexts by extending Verb, TinFoil and Context:

**CoffeeScript**

``` CoffeeScript
{ TinFoil } = require 'tin-foil'

class SceneObject extends TinFoil
  @of_type 'scene'
  @identified_by (event) -> "/activities/scene/#{event.scene.id}"
  @named_from (event) -> event.scene.title
```

**JavaScript**

``` JavaScript
var SceneObject = TinFoil.extend()
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

or build them on the fly

``` CoffeeScript
SceneEnteredEvent = Statement.as 'user', i: 'entered', a: 'scene', in: 'scenario'
```

and compile your events

``` CoffeeScript
tinCan = SceneEnteredEvent.compile(myEvent)
```

## License
Copyright (c) 2013 Skilitix
Licensed under the MIT license.
