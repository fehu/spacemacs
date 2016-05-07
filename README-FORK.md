## Spacemacs Fork

Configured for Haskell Literate Programming (with LaTeX).

### Features

* Uses _mmm-mode_ for multiple _major-mode_s support inside a buffer.
* Uses a separate directory for LaTeX builds.
* Handles `*.tex` and `*.lhs` dependencies.
* Standalone/composite documents support.
* Most _haskell-mode_ bindings has been remapped
  <kbd> SPC m ...</kbd> → <kbd>SPC H ...</kbd>
  in order to avoid collisions with _LaTeX-mode_.
* Uses ASpell for spelling (EN/ES)

  <kbd><f8></kbd> -- switch language
  
  <kbd>S-<f8></kbd> -- toggle words splitting (shift key)


### Installation

1. Install _spacemacs_ normally (tested with `vim` mode).
2. Install `mmm-mode` by pressing <kbd>M-x</kbd> and typing `package-install`.
3. Add fork repository: `git remote add fork https://github.com/fehu/spacemacs.git`.
4. Checkout it: `git pull fork master`.
5. Replace `.spacemacs` file: `cp ~/.emacs.d/DOTFILE-.spacemacs ~/.spacemacs`.

### Requirements

* **ghc-mod** -- needed by `haskell-mode` layer; install it with `cabal`.
* **lhs2TeX** -- TeX generation; install it with `cabal`.
* **aspell**  -- spelling, used instead of default `ispell`.


### Usage

To be able to generate pdf documents from `*.lhs` files,
set `latex-build-command` variable to `"lhsTeX"`.

#### Flags
* `lhs-build-standalone-flag` sets `standalone` flag (see `lhs2TeX -s`)
* `lhs-copy-literate-src-flag` indicates to copy `*.lhs` files to 
  LaTeX build directory.

#### Variables


Word-splitting settings:
* `spell-together-min` -- minimum _sub-word_ length
* `spell-together-lim` -- maximum _sub-word_s per word
