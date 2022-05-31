# frozen_string_literal: true

require "thor"

module Licensor
  class App < Thor
    option :verbose, aliases: "-v"
    option :author, aliases: "-a" # TODO: handle -a "This is a test" vs -a This is a test
    option :output, aliases: "-o"
    desc "generate LICENSE", "Generate a license file"
    def generate(license_key)
      license = Licensor::Logic.match_license(license_key)
      if license.nil?
        puts "The provided license was not found"
        return
      end

      # verbose = options[:verbose]

      output_path = options[:output]
      output_path = output_path ? output_path.strip : "LICENSE"

      author = options[:author]
      author = author ? author.strip : Licensor::Logic.fetch_author

      create_file(license, author, output_path)
    end

    no_commands do
      def create_file(license, author, output_path)
        output_path = output_path.strip

        if File.file?(output_path)
          puts "The output path #{output_path} is already a file"
          return
        end

        content = Licensor::Logic.format_license(license, author)

        File.write(output_path, content)
      end
    end

    # default_task :generate
  end
end
