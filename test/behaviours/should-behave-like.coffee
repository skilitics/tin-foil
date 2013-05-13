props = require './definitions'

exports.interactionActivities = (obj) ->

  describe 'interactionType', ->
    props.shouldHaveDefinition obj, 'interactionType'

  describe 'correctResponsePattern', ->
    props.shouldHaveDefinition obj, 'correctResponsePattern'
    props.shouldHaveAlias obj, 'correctResponsePattern', 'add_correct_response_pattern'

  describe 'choices', ->
    props.shouldHaveDefinition obj, 'choices'
    props.shouldHaveAlias obj, 'choices', 'add_choice'


exports.inverseFunctionalIdentifier = (obj) ->

  describe 'mbox', ->
    props.shouldHaveDefinition obj, 'mbox'
    props.shouldHaveAlias obj, 'mbox', 'mbox_as'
    props.shouldHaveAlias obj, 'mbox', 'mbox_from'

  describe 'mbox_sha1sum', ->

  describe 'openID', ->
    props.shouldHaveDefinition obj, 'openID'
    props.shouldHaveAlias obj, 'openID', 'openId_as'
    props.shouldHaveAlias obj, 'openID', 'openId_from'

  describe 'account', ->
    props.shouldHaveDefinition obj, 'account'
