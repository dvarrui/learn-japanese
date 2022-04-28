#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/dictionary'

class RomajiWordGame

  def initialize(level=1, max=10)
    @level = level
    @score = 1
    @max_score = max

    @words = Dictionary.words
  end

  def run
    Debug.puts_line
    while @score < @max_score
      @keys.shuffle!
      guess_romanji(@keys[0])
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
