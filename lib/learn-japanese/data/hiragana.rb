require "yaml"
require "colorize"
require_relative "../debug"

class Hiragana
  # Silabario japonés
  attr_reader :data

  def initialize
    filename = File.join(File.dirname(__FILE__), "hiragana.yaml")
    @data = YAML.load_file(filename)
  end

  def symbols
    @data.keys
  end

  def sounds_to_hiragana(sounds)
    hiraganas = all_groups
    hiragana_array = sounds.map { hiraganas[_1.to_sym] || "*" }
    hiragana_array.join("")
  end

  def hiraganas_to_sound(hiraganas_input)
    all_hiraganas = all_groups

    sounds_array = hiraganas_input.map do |hiragana_input|
      sound = "*"
      all_hiraganas.each_pair do |key, value|
        sound = key if value == hiragana_input
      end
      sound
    end

    sounds_array.join("")
  end

  def show_help
    puts ("=" * 20).white
    puts "Hiragana help\n".upcase.cyan
  end
end
