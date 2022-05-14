#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/hiragana'

class ShortAnswerGame

  def initialize(level=1, max=10)
    @hiragana = Hiragana.new

    @level = level
    @score = 1
    @max_score = max

    @silabario = @hiragana.groups( (1..level).to_a )

    @keys = @silabario.keys
  end

  def show_help(level=1)
    @hiragana.show_help(level)
  end

  def run
    @hiragana.show_help(@level)
    Debug.puts_line
    while @score < @max_score
      @keys.shuffle!
      guess_japanise_symbol(@keys[0])
    end
  end

  private

  def guess_japanise_symbol(key)
    japanise = @silabario[key]
    progress = "[ #{@score}/#{@max_score} ]"
    print  "#{progress.white} #{japanise.light_yellow} ? "

    resp = STDIN.gets.chomp
    exit if resp.empty?
    if resp == key.to_s
      @score += 1
      return true
    end
    puts "La respuesta es #{key}".light_red
    false
  end
end
