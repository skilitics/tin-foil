# Tin Foil

Thin Tin Can wrapper for statement generation

## Getting Started
Install the module with: `npm install tin-foil`

## Usage

Define your verbs, objects and contexts by extending Verb, TinFoil and Context:

**CoffeeScript**

``` CoffeeScript
{ Activity } = require 'tin-foil'

class SceneActivity extends Activity
  @inherit()

  @identify_from (event) -> "http://skilitix.com/xapi/activities/scene/#{event.scene.id}"

  @definition_named 'en-US': 'Scene'
  @definition_typed_as 'http://skilitix.com/xapi/activities/node'
  @definition_description_from (event) -> 'en-US': event.scene.title
```

**JavaScript**

``` JavaScript
Activity = require('tin-foil').Activity;

var SceneActivity = Activity.extend()
    .identify_from(function (event) { return "http://skilitix.com/xapi/activities/scene/" + event.scene.id; })
    .definition_named({'en-US': 'Scene'})
    .definition_typed_as('http://skilitix.com/xapi/activities/node')
    .definition_description_from(function (event) { return {'en-US': event.scene.title}; });
```

Then define and compile your statements

``` CoffeeScript
SceneEnteredStatement = Statement.as 'user', i: 'entered', a: 'scene', in: 'scenario'
SceneEnteredStatement.compile(myEvent)
```

## License
Copyright (c) 2013 Skilitix
Licensed under the MIT license.
