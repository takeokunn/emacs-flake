{ epkgs }:
with epkgs; [
  # Basic Lisp
  paredit
  rainbow-delimiters

  # Common Lisp
  slime

  # Emacs Lisp
  eros
  trinary
  elsa
  lispxmp
  macrostep
  elisp-slime-nav
  nameless
  elisp-refs
  highlight-quoted
  highlight-defined

  # Clojure
  anakondo
  cider
  kibit-helper
  clj-refactor
  inf-clojure

  # C/C++
  clang-format

  # Csv
  # rainbow-csv

  # JavaScript/TypeScript
  nodejs-repl
  js2-refactor
  jest

  # Ruby
  robe
  rubocop
  ruby-refactor
  inf-ruby
  yard-mode

  # SQL
  sql-indent

  # PHP
  composer
  php-runtime
  psysh
  # laravel-tinker-repl
  # emacs-php-doc-block
  phpstan
  phpunit

  # Markdown
  poly-markdown
  markdown-preview-mode

  # Fish
  # fish-repl

  # Haskell
  hindent

  # Web
  emmet-mode

  # JSON
  jq-mode
  json-reformat

  # Python
  py-isort
]
