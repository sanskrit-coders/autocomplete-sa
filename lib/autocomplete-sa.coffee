fs = require 'fs'
path = require 'path'
provider = require './provider'

loadDicts = (dictCategory)->
  dictDir = path.resolve(__dirname, '..', 'dicts', dictCategory)
  files = fs.readdirSync dictDir
  console.log "files", files
  provider.loadDict(path.resolve(dictDir, file)) for file in files

module.exports =
  activate: ->
    loadDicts(dictCategory) for dictCategory in provider.dictCategories.split(',')

  getProvider: ->
      provider
