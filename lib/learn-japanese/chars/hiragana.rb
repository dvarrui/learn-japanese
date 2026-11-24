require "yaml"
require "colorize"
require_relative "../show"

module Chars
  class Hiragana
    # Silabario japonés
    attr_reader :data

    def initialize
      filename = File.join(File.dirname(__FILE__), "hiragana", "chars.yaml")
      @data = YAML.load_file(filename)
    end

    def symbols
      @data.keys
    end

    def sounds_to_hiragana(sounds)
      hiragana_array = sounds.map { @data[_1] || "*" }
      hiragana_array.join("")
    end

    def hiraganas_to_sound(hiraganas_input)
      sounds_array = hiraganas_input.map do |hiragana_input|
        sound = "*"
        @data.each_pair do |key, value|
          sound = key if value == hiragana_input
        end
        sound
      end

      sounds_array.join("")
    end

    def show
      Show.line
      puts "Hiragana help\n".upcase.cyan
      Show.table(@data)
      Show.line
    end
  end
end
