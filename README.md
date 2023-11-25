WebAssembly Text Format Syntax Support for Vim
==============================================

[vim-wasm][] provides a [WebAssembly][] filetype `wat` support; syntax, filetype detection, and indentation.
This filetype plugin defines highlights based on [WebAssembly text format spec][].

Now this plugin is included in the [official Vim runtime files][vim runtime dir]. This repository is for
development. Unless you want to use HEAD version, you don't need to install this plugin.

[vim-wasm]: https://github.com/rhysd/vim-wasm
[WebAssembly]: https://webassembly.org/
[WebAssembly text format spec]: https://webassembly.github.io/spec/core/text/index.html
[vim runtime dir]: https://github.com/vim/vim/tree/master/runtime


## Installation and Usage

Copy `ftdetect`, `ftplugin`, `indent` and `syntax` directories into your `~/.vim` directory or use your
favorite plugin manager to install.
This plugin automatically detects `*.wat` (and `*.wast`) files as WebAssembly text format.

| `set filetype=wat` | `set filetype=lisp` |
|---------------------|---------------------|
| <img width="515" alt="wat" src="https://raw.githubusercontent.com/rhysd/ss/master/vim-wast/wast.png"> | <img width="515" alt="lisp" src="https://raw.githubusercontent.com/rhysd/ss/master/vim-wast/lisp.png"> |


## License

This plugin is distributed under [the MIT License](LICENSE).
