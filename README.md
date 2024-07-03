## == 🏴‍☠️ GptHelpr == Helping to dig your codebase and cook GPT-XX instructions

### What is GptHelpr?

It is sometime necessary to provide context and explanations for your code. Instead of manually copying and formatting code snippets, GPT-Helpr automates the process with an interactive cli, generating a well-structured Markdown output, which can be copied to your clipboard or printed to file.

### Features

- **Interactive Mode**: Easily specify file paths and ranges interactively.
- **Line Numbers**: Option to include line numbers in the output.
- **Completion Support**: Supports tab completion for file paths.
- **Output to File**: Option to write the generated output to a file.

### Installation

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

### Usage

#### Basic Usage

Run the tool in interactive mode:
```sh
gpt_helpr -i -ln
```

#### Command-Line Arguments

You can also provide file paths and instructions directly via command-line arguments:
```sh
gpt_helpr <file1> <instructions> / <file2> <instructions>
```

#### Options

- `--interactive` or `-i`: Run the tool in interactive mode.
- `--file` or `-f`: Write the output to a file.
- `--line-numbers` or `-ln`: Include line numbers in the output.

### Examples

#### Interactive Mode

1. Run the tool in interactive mode:
   ```sh
   # note lmk is an alias for gpt_helpr -i -ln
   $ lmk
   == 🏴‍☠️ GptHelpr 0.2.2 == Helping to dig your codebase and cook GPT-XX instructions [current directory /Users/etozzato/WorkSpace/_AINZ/pizzatarians.com]

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
   ```

2. You can add more files and instructions in the same way.

3. Profit!

#### Command-Line Mode

1. Generate output for specified files:
   ```sh
   gpt_helpr app/controllers/pos_controller.rb:10:20 "Describe the controller logic" / app/views/pos/index.html.erb "Explain the view template"
   ```

2. Write the output to a file:
   ```sh
   gpt_helpr app/controllers/pos_controller.rb:10:20 "Describe the controller logic" / app/views/pos/index.html.erb "Explain the view template" --file
   ```

## Contributing

Contributions are welcome! If you have suggestions for improvements or find any issues, please open an issue or create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.