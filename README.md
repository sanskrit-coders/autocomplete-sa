
## Introduction
An [autocomplete-plus](https://github.com/atom/autocomplete-plus) provider completing Sanskrit words with the hint of English explanation.

This package requires [autocomplete-plus](https://github.com/atom/autocomplete-plus) and [fuzzaldrin](https://github.com/atom/fuzzaldrin).

The package [fuzzaldrin](https://github.com/atom/fuzzaldrin) is one of the core package of atom which has been installed by default. This package offers a fuzzy match function which is useful for uncertain words. The dictionary is based on the Oxford advanced learner dictionary.

## Usage
For the defined file types, it will complete automatically. Like the figure shows below.

![A screenshot of the package using](https://raw.githubusercontent.com/sanskrit-coders/autocomplete-sa/master/autocomplete-sa-demo.gif)

 The default setting includes text file, latex file, markdown file, null grammar file. If you need to add your file type, add the type string in the setting panel.

![A screenshot of the setting page](https://raw.githubusercontent.com/sanskrit-coders/autocomplete-sa/master/setting.png)

To enable completion for your current file type, open one of the file and put your cursor in, open the Command Palette (cmd+shift+p or ctrl+shift+p), and run the: "Log Cursor Scope" command. This will trigger a notification which will contain a list of scopes. The first scope that's listed is the one you should add to the list of scopes in the settings for the package. Here are some examples: .source.gfm (markdown file), .text.plain (text file), .text.tex.latex (latex file).

## Contribution
- You can add new word lists to dicts folder.

### TODO
- Use some library like https://github.com/tuxor1337/stardict.js?files=1 to look up meanings and /or words from stardict files. 

## Acknowledgement
- Inspired by [autocomplete-en-en](https://github.com/wushuaibuaa/autocomplete-en-en).
- License: [MIT](https://github.com/sanskrit-coders/autocomplete-sa/blob/master/LICENSE.md) 

