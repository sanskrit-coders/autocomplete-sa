provider = require './provider'

module.exports =
  activate: ->
      provider.loadDicts()

  getProvider: ->
      provider
