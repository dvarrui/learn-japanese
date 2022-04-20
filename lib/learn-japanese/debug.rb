
require 'colorize'

class Debug

  def self.puts_group(group)
    keys = group.keys
    keys = group.keys.map { |i| " #{i}" } if group.keys.first == :a

    STDOUT.puts group.values.join(' ').light_blue
    STDOUT.puts keys.join(' ').blue
    STDOUT.puts "\n"
  end

  def self.puts_line
    STDOUT.puts ('=' * 20).white
  end

  def self.break
    require 'debug'
    binding.break
  end
end
