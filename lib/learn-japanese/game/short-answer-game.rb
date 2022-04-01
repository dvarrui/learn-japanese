#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../hiragana'

class ShortAnswerGame

  def initialize(level=1)
    @level = level
    @score = 1
    @max_score = 10

    @silabario = Hiragana.group1
    @silabario.merge! Hiragana.group2 if @level > 1
    @keys = @silabario.keys
  end

  def self.show_help(level=1)
    Hiragana.show_help(level)
  end

  def run
    Debug.puts_line
    while @score < @max_score
      @keys.shuffle!
      @keys.each { |key| guess_japanise_symbol(key) }
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
