props = require './props'

exports.interactionActivities = (obj) ->

  describe 'interactionType', ->
    props.shouldHaveProp obj, 'interactionType'

  describe 'correctResponsePattern', ->
    props.shouldHaveProp obj, 'correctResponsePattern'
    props.shouldHaveAlias obj, 'correctResponsePattern', 'add_correct_response_pattern'

  describe 'choices', ->
    props.shouldHaveProp obj, 'choices'
    props.shouldHaveAlias obj, 'choices', 'add_choice'


exports.inverseFunctionalIdentifier = (obj) ->

  describe 'mbox', ->
    props.shouldHaveProp obj, 'mbox'
    props.shouldHaveAlias obj, 'mbox', 'mbox_as'
    props.shouldHaveAlias obj, 'mbox', 'mbox_from'

  describe 'mbox_sha1sum', ->

  describe 'openID', ->
    props.shouldHaveProp obj, 'openID'
    props.shouldHaveAlias obj, 'openID', 'openId_as'
    props.shouldHaveAlias obj, 'openID', 'openId_from'

  describe 'account', ->
    props.shouldHaveProp obj, 'account'
