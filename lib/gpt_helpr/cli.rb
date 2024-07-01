require 'fileutils'
require 'readline'
require 'shellwords'
require 'time'

module GptHelpr
  class CLI

    def self.start(args=[])

      line_numbers = args.include?('-ln') || args.include?('--line-numbers')

      if args.include?('-i') || args.include?('--interactive')
        files = interactive_mode(line_numbers)
      else

        if args.empty?
          puts 'Usage: gpt_helpr <file1> <re: instructions> / <file2> <re: instructions> [--f] [--file] [--i] [--interactive] [--ln] [--line-numbers]'
          exit 1
        end

        separator_indices = args.each_index.select { |i| args[i] == '/' }
        parts = []
        last_index = 0

        separator_indices.each do |index|
          parts << args[last_index...index]
          last_index = index + 1
        end
        parts << args[last_index..]

        files = parts.map do |part|
          file_path = part[0]
          re_text = part[1]
          lines_range = file_path.include?(':') ? file_path.split(':', 2).last : nil
          file_path = file_path.split(':').first

          [file_path, re_text, lines_range]
        end
      end

      final_output = generate_output(files, line_numbers)
      copy_to_clipboard(final_output)

      if args.include?('-f') || args.include?('--file')
        write_to_file(final_output)
      else
        puts final_output
      end
    end

    def self.process_file(file_path, lines_range = nil, line_numbers = false)
      content = File.read(file_path)

      if lines_range
        start_line, end_line = lines_range.split(':').map(&:to_i)
        content = content.lines[start_line - 1, end_line - start_line + 1].join
      end

      if line_numbers
        start_index = lines_range ? start_line : 1
        content = content.lines.each_with_index.map { |line, index| "#{start_index + index}: #{line}" }.join
      end

      content
    rescue => e
      "Error reading file: #{e.message}"
    end

    def self.generate_output(files, line_numbers = false)
      output = ''
      files.each do |file_info|
        file_path, re_text, lines_range = file_info

        content = process_file(file_path, lines_range, line_numbers)

        output += "#### file source  `#{file_path}`\n"
        output += "```\n"
        output += "#{content}\n"
        output += "```\n\n"
        output += "#{re_text}\n\n"
        output += "#### end of  `#{file_path}`\n"
        output += "\n"
      end
      output
    end

    def self.copy_to_clipboard(output)
      escaped_output = Shellwords.escape(output)
      system("echo #{escaped_output} | pbcopy")
    end

    def self.write_to_file(output)
      timestamp = Time.now.utc.iso8601
      filename = "gpt_#{timestamp}.md"
      File.write(filename, output)
      puts "Output written to #{filename}"
    end

    def self.interactive_mode(line_numbers = false)
      files = []

      while true
        begin
          file_input = Readline.readline('File Path (optional :start:end): ', true)
          break if file_input.nil? || file_input.strip.empty?

          file_path, lines_range = file_input.split(':', 2)
          re_text = Readline.readline('Instructions: ', true)

          files << [file_path.strip, re_text.strip, lines_range]
        rescue Interrupt
          break
        end
      end

      files
    end
  end
end
