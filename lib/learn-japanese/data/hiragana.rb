require 'colorize'
require_relative '../debug'

# Silabario japonés
class Hiragana

  def self.group1
    { a: "\u{3042}",
      i: "\u{3044}",
      u: "\u{3046}",
      e: "\u{3048}",
      o: "\u{304A}"
    }
  end

  def self.group2
    { ka: "\u{304B}",
      ki: "\u{304D}",
      ku: "\u{304F}",
      ke: "\u{3051}",
      ko: "\u{3053}"
    }
  end

  def self.group3
    { sa: "\u{3055}",
      shi: "\u{3057}",
      su: "\u{3059}",
      se: "\u{305B}",
      so: "\u{305D}"
    }
  end

  def self.group4
    { ta: "\u{305F}",
      chi: "\u{3061}",
      tsu: "\u{3064}",
      te: "\u{3066}",
      to: "\u{3068}"
    }
  end

  def self.group5
    { na: "\u{306A}",
      ni: "\u{306B}",
      nu: "\u{306C}",
      ne: "\u{306D}",
      no: "\u{306E}"
    }
  end

  def self.group6
    { ha: "\u{306F}",
      hi: "\u{3072}",
      hu: "\u{3075}",
      he: "\u{3078}",
      ho: "\u{307B}"
    }
  end

  def self.all
    output = self.group1
    output.merge!(self.group2)
    output.merge!(self.group3)
    output.merge!(self.group4)
    output.merge!(self.group5)
    output.merge!(self.group6)
    output
  end

  def self.groups(levels)
    return self.all if levels == :all
    hiragana = {}
    hiragana.merge! Hiragana.group1 if levels.include? 1
    hiragana.merge! Hiragana.group2 if levels.include? 2
    hiragana.merge! Hiragana.group3 if levels.include? 3
    hiragana.merge! Hiragana.group4 if levels.include? 4
    hiragana.merge! Hiragana.group4 if levels.include? 5
    hiragana.merge! Hiragana.group4 if levels.include? 6
    hiragana
  end

  def self.sounds_to_hiragana(sounds)
    hiraganas = Hiragana.all
    hiragana_array = sounds.map { hiraganas[_1.to_sym] || '*' }
    hiragana = hiragana_array.join('')
  end

  def self.hiraganas_to_sound(hiraganas_input)
    all_hiraganas = Hiragana.all

    sounds_array = hiraganas_input.map do |hiragana_input|
      sound = '*'
      all_hiraganas.each_pair do |key, value|
        sound = key if value == hiragana_input
      end
      sound
    end

    sounds_array.join('')
  end

  def self.show_help(level=1)
    Debug.puts_line
    puts "Hiragana help\n".upcase.cyan

    Debug.puts_group Hiragana.group1
    Debug.puts_group Hiragana.group2 if level > 1
    Debug.puts_group Hiragana.group3 if level > 2
    Debug.puts_group Hiragana.group4 if level > 3
    Debug.puts_group Hiragana.group5 if level > 4
    Debug.puts_group Hiragana.group6 if level > 5
    Debug.puts_group Hiragana.group7 if level > 6
  end
end
