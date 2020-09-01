provider = require './provider'

module.exports =
  activate: ->
      provider.loadDict('tiNanta-dhaval')

  getProvider: ->
      provider
