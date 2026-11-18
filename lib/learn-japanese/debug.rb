require "colorize"
require "unicode/display_width"

class Debug
  def self.puts_data(data)
    lines = data.group_by { |k, _v| k[-1]}

    lines.each do |_k, items|
      line1 = []
      line2 = []
      maxcol = 5
      items.each do |es, ja|
        line1 << ja
        line1 << " " * (maxcol - Unicode::DisplayWidth.of(ja))
        line2 << es
        line2 << " " * (maxcol - es.length)
      end
      puts line1.join("").light_blue
      puts line2.join("").blue

    end
    puts "\n"
  end

  def self.puts_line
    puts ("=" * 20).white
  end
end
