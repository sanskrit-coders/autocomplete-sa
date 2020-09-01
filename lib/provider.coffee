# { BufferedProcess } = require 'atom'
fs = require 'fs'
fuzzaldrin = require 'fuzzaldrin'

module.exports =
  selector: atom.config.get('autocomplete-sa.FileType')
  dictCategories: atom.config.get('autocomplete-sa.dictCategories')
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

  loadDict: (file)->
      fs.readFile file, (error, content) =>
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
