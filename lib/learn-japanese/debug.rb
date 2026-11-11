require "colorize"

class Debug
  def self.puts_group(group)
    keys = group.keys
    keys = group.keys.map { |i| " #{i}" } if group.keys.first == :a

    $stdout.puts group.values.map { _1.to_s.ljust(2) }.join(" ").light_blue
    $stdout.puts keys.map { _1.to_s.ljust(3) }.join(" ").blue
    $stdout.puts "\n"
  end

  def self.puts_line
    $stdout.puts ("=" * 20).white
  end
end
