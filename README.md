# GPT_Helpr

GPT_Helpr is a Ruby gem that provides a command-line tool for generating formatted programming prompts based on the content of specified files. This tool is particularly useful for efficiently sharing code snippets with detailed explanations.

## Features

- **Interactive Mode**: Easily specify file paths and ranges interactively.
- **Line Numbers**: Option to include line numbers in the output.
- **Completion Support**: Supports tab completion for file paths.
- **Output to File**: Option to write the generated output to a file.

## Installation

1. **Add the Gem to Your Gemfile**
   ```ruby
   gem 'gpt_helpr'
   ```

2. **Install the Gem**
   ```sh
   bundle install
   ```

3. **Or Install Directly via Gem Command**
   ```sh
   gem install gpt_helpr
   ```

## Usage

### Basic Usage

Run the tool in interactive mode:
```sh
gpt_helpr --interactive
```

### Command-Line Arguments

You can also provide file paths and instructions directly via command-line arguments:
```sh
gpt_helpr <file1> <re: instructions> / <file2> <re: instructions>
```

### Options

- `--interactive` or `-i`: Run the tool in interactive mode.
- `--file` or `-f`: Write the output to a file.
- `--line-numbers` or `-ln`: Include line numbers in the output.

### Examples

#### Interactive Mode

1. Run the tool:

```
➜ gpt_helpr -i -ln
File path (optional :start:end): TAB ->
Capfile                   INSTALL.md                REVISION                  bin
Gemfile                   Procfile                  Rakefile                  config
Gemfile.lock              Procfile.dev              VERSION                   config.ru
Guardfile                 README.md                 app                       db

File path (optional :start:end): bin/ TAB ->
bin/bundle         bin/db-backup.sh   bin/db-restore.sh  bin/gpt_helpr         bin/rails          bin/rake           bin/rubocop        bin/s3_sync.sh     bin/setup          bin/update

File path (optional :start:end): bin/gpt_helpr:9:14
Instructions: can you explain these lines?
File path (optional :start:end):
```

2. The output will be:
```
   #### file source  `bin/gpt_helpr`
   9:
   10: Readline.completion_append_character = nil
   11: Readline.completion_proc = -> (input) {
   12:   Dir[input+'*'].grep(/^#{Regexp.escape(input)}/)
   13: }
   14:

   can you explain these lines?

   #### end of  `bin/gpt_helpr`
```
3. You can add more files and instructions in the same way.

4. The output will be also copied to the clipboard!

#### Command-Line Mode

1. Generate output for specified files:
   ```sh
   gpt_helpr app/controllers/pos_controller.rb:10:20 "Describe the controller logic" / app/views/pos/index.html.erb "Explain the view template"
   ```

2. Write the output to a file:
   ```sh
   gpt_helpr app/controllers/pos_controller.rb:10:20 "Describe the controller logic" / app/views/pos/index.html.erb "Explain the view template" --file
   ```

## Why GPT_Helpr?

GPT_Helpr is designed to save time and effort when sharing code snippets. It's often necessary to provide context and explanations for the code. Instead of manually copying and formatting code snippets, GPT_Helpr automates the process, generating well-structured Markdown output.

This can be useful for:

- **Creating Documentation**: Quickly generate descriptions of code segments for documentation.
- **Sharing Code**: Share specific parts of your codebase with clear descriptions.
- **Teaching and Learning**: Provide examples and explanations of code in a consistent format.

## Contributing

Contributions are welcome! If you have suggestions for improvements or find any issues, please open an issue or create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.