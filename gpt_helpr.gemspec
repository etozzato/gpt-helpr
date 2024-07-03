# frozen_string_literal: true

require_relative 'lib/gpt_helpr/version'

Gem::Specification.new do |spec|
  spec.name          = 'gpt_helpr'
  spec.version       = GptHelpr::VERSION
  spec.license       = 'MIT'
  spec.authors       = ['Emanuele Tozzato']
  spec.email         = ['etozzato@gmail.com']

  spec.summary       = "== 🏴‍☠️ GptHelpr #{GptHelpr::VERSION} == Helping to dig your codebase and cook GPT-XX instructions"
  spec.description   = <<~DESC
    === What is GptHelpr?

    It is sometime necessary to provide context and explanations for your code. Instead of manually copying and formatting code snippets, GPT-Helpr automates the process with an interactive cli, generating a well-structured Markdown output, which can be copied to your clipboard or printed to file.

    === Example Usage

      # note lmk is an alias for gpt_helpr -i -ln
      $ lmk
      == 🏴‍☠️ GptHelpr #{GptHelpr::VERSION} == Helping to dig your codebase and cook GPT-XX instructions [current directory /Users/etozzato/WorkSpace/_AINZ/pizzatarians.com]

      File Path (optional :start:end): TAB ->
      favicon.ico                 hey.md                      js                          random-acts-of-pizza.md
      _config.yml                 _site                       draft                       fonts
      images                      kneading-baking-academy.md  _exe                        academy
      favicon.gif                 hands-in-dough.md           index.md                    parties-and-events.md

      File Path (optional :start:end): hey.md 1:22
      Instructions: can you improve this text? Do you see any issues with the template?
      File Path (optional :start:end):

      # this is the generated output (also copied to the clipboard)
      ==== file source  `hey.md 1:22`

      1: ---
      2: title: Hey, hello!
      3: layout: default
      4: ---
      5:
      6: # {{ page.title }}
      7: ----
      8:
      9: <div class="row">
      10:   <div class="col-md-12">
      11:     <p class='justin'>
      12:       Nice to meet you, I am *Mek*!
      13:     </p>
      14:     <p class='listo'>
      15:       I am a self-proclaimed pizza guru and I am here to teach & learn. Originally from Venice, Italy you can find me in San Diego, CA.
      16:     </p>
      17:     <p class='listo'>
      18:       In my spare time, I write code @ PlayStation!
      19:     </p>
      20:   </div>
      21: </div>
      22:

      can you improve this text? Do you see any issues with the template?

      ==== end of  `hey.md`

  DESC

  spec.homepage = 'https://www.etozzato.com'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/etozzato/gpt-helpr'
  spec.metadata['changelog_uri']   = 'https://github.com/etozzato/gpt-helpr/blob/main/CHANGELOG.md'

  spec.files         = Dir['lib/**/*', 'bin/**/*', 'README.md']
  spec.bindir        = 'bin'
  spec.executables   = %w[gpt_helpr lmk]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'readline', '~> 0.0.3'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
