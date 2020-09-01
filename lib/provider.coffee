# { BufferedProcess } = require 'atom'
fs = require 'fs'
path = require 'path'
fuzzaldrin = require 'fuzzaldrin'

module.exports =
  selector: atom.config.get('autocomplete-sa-en.FileType')
  inclusionPriority: 0
  excludeLowerPriority: false

  wordRegex: /[ँ-ॿ][ँ-ॿ꣠-ꣿ᳐-ᳺ]*$/
  properties: {}
  keys: []

  getSuggestions: ({editor, bufferPosition}) ->
      prefix = @getPrefix(editor, bufferPosition)
      return [] unless prefix?.length >= 2
      return @getWordsSuggestions(prefix)

  getPrefix: (editor, bufferPosition) ->
    line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition])
    line.match(@wordRegex)?[0] or ''

  loadDicts: ->
      fs.readFile path.resolve(__dirname, '..', 'tiNanta-dict.json'), (error, content) =>
          return if error
          @properties = JSON.parse(content)
          @keys = Object.keys(@properties)

  getWordsSuggestions: (prefix) ->
    words = fuzzaldrin.filter(@keys, prefix)
    for word in words
      {
        text: word
        rightLabel: @properties[word].description
        description: @properties[word].description
        replacementPrefix: prefix
      }
