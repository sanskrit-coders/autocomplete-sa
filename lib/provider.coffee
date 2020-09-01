# { BufferedProcess } = require 'atom'
fs = require 'fs'
path = require 'path'
fuzzaldrin = require 'fuzzaldrin'

module.exports =
  selector: atom.config.get('autocomplete-sa.FileType')
  inclusionPriority: 0
  excludeLowerPriority: false

  wordRegex: /[ँ-ॿ][ँ-ॿ꣠-ꣿ᳐-ᳺ]*$/
  keys: []

  getSuggestions: ({editor, bufferPosition}) ->
      prefix = @getPrefix(editor, bufferPosition)
      return [] unless prefix?.length >= 2
      return @getWordsSuggestions(prefix)

  getPrefix: (editor, bufferPosition) ->
    line = editor.getTextInRange([[bufferPosition.row, 0], bufferPosition])
    line.match(@wordRegex)?[0] or ''

  loadDict: (dictName)->
      fs.readFile path.resolve(__dirname, '..', 'dicts', dictName + '.csv'), (error, content) =>
          return if error
          words = content.toString().split('\n')
          @keys = @keys.concat(words)

  getWordsSuggestions: (prefix) ->
    words = fuzzaldrin.filter(@keys, prefix)
    for word in words
      {
        text: word
        rightLabel: ""
        description: ""
        replacementPrefix: prefix
      }
