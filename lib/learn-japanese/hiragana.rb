require 'colorize'
require_relative 'debug'

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

  def self.all
    output = self.group1
    output.merge!(self.group2)
    output.merge!(self.group3)
    output.merge!(self.group4)
    output
  end

  def self.show_help(level=1)
    Debug.puts_line
    puts "Hiragana help\n".upcase.cyan

    Debug.puts_group Hiragana.group1
    Debug.puts_group Hiragana.group2 if level > 1
    Debug.puts_group Hiragana.group3 if level > 2
    Debug.puts_group Hiragana.group4 if level > 3
  end
end
