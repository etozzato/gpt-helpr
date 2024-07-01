# frozen_string_literal: true

require_relative 'lib/gpt_helpr/version'

Gem::Specification.new do |spec|
  spec.name = 'gpt_helpr'
  spec.version = GptHelpr::VERSION
  spec.license = 'MIT'
  spec.authors = ['Emanuele Tozzato']
  spec.email = ['etozzato@gmail.com']

  spec.summary = 'GPT-Helpr is designed to save time and effort when sharing code snippets'
  spec.description = 'It is often necessary to provide context and explanations for the code. Instead of manually copying and formatting code snippets, GPT-Helpr automates the process, generating well-structured Markdown output.'
  spec.homepage = 'https://etozzato.com'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = ''

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/etozzato/gpt-helpr'
  spec.metadata['changelog_uri'] = 'https://github.com/etozzato/gpt-helpr/blob/main/CHANGELOG.md'

  spec.files         = Dir['lib/**/*', 'bin/**/*', 'README.md']
  spec.executables   = %w[gpt_helpr lmk]
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fileutils', '~> 1.6.0'
  spec.add_runtime_dependency 'readline', '~> 0.0.3'
  spec.add_runtime_dependency 'shellwords', '~> 0.1.0'
end
