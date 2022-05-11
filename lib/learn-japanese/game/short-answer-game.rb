#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/hiragana'

class ShortAnswerGame

  def initialize(level=1, max=10)
    @level = level
    @score = 1
    @max_score = max

    @silabario = Hiragana.group1
    @silabario.merge! Hiragana.group2 if @level > 1
    @silabario.merge! Hiragana.group3 if @level > 2
    @silabario.merge! Hiragana.group4 if @level > 3
    @silabario.merge! Hiragana.group5 if @level > 4
    @silabario.merge! Hiragana.group6 if @level > 5

    @keys = @silabario.keys
  end

  def self.show_help(level=1)
    Hiragana.show_help(level)
  end

  def run
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
