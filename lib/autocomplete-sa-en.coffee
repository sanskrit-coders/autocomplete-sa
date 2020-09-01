provider = require './provider'

module.exports =
  activate: ->
      provider.loadDict()

  getProvider: ->
      provider
