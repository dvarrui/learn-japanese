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

  def self.show_help(level=1)
    Debug.puts_line
    puts "Hiragana help\n".upcase.cyan

    Debug.puts_group Hiragana.group1
    Debug.puts_group Hiragana.group2 if level > 1
  end
end
