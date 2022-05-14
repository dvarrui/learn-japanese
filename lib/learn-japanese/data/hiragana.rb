require 'yaml'
require 'colorize'
require_relative '../debug'

class Hiragana
  # Silabario japonés
  attr_reader :data

  def initialize
    filename = File.join(File.dirname(__FILE__), 'hiragana.yaml')
    @data = YAML.load(File.read(filename))
  end

  def group(index)
    @data[index - 1]
  end

  def all
    output = group 1
    output.merge!(group 2)
    output.merge!(group 3)
    output.merge!(group 4)
    output.merge!(group 5)
    output.merge!(group 6)
    output
  end

  def groups(levels)
    return all if levels == :all
    hiragana = {}
    hiragana.merge! group 1 if levels.include? 1
    hiragana.merge! group 2 if levels.include? 2
    hiragana.merge! group 3 if levels.include? 3
    hiragana.merge! group 4 if levels.include? 4
    hiragana.merge! group 4 if levels.include? 5
    hiragana.merge! group 5 if levels.include? 6
    hiragana
  end

  def sounds_to_hiragana(sounds)
    hiraganas = all
    hiragana_array = sounds.map { hiraganas[_1.to_sym] || '*' }
    hiragana = hiragana_array.join('')
  end

  def hiraganas_to_sound(hiraganas_input)
    all_hiraganas = all

    sounds_array = hiraganas_input.map do |hiragana_input|
      sound = '*'
      all_hiraganas.each_pair do |key, value|
        sound = key if value == hiragana_input
      end
      sound
    end

    sounds_array.join('')
  end

  def show_help(level=1)
    Debug.puts_line
    puts "Hiragana help\n".upcase.cyan

    Debug.puts_group group(1)
    Debug.puts_group group(2) if level > 1
    Debug.puts_group group(3) if level > 2
    Debug.puts_group group(4) if level > 3
    Debug.puts_group group(5) if level > 4
    Debug.puts_group group(6) if level > 5
    Debug.puts_group group(7) if level > 6
  end
end
