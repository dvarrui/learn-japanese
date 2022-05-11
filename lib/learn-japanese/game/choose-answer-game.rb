#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/hiragana'

class ChooseAnswerGame

  def initialize(level=1, max=10)
    @level = level
    @score = 1
    @max_score = max

    #@silabario = Hiragana.group1
    #@silabario.merge! Hiragana.group2 if @level > 1
    #@silabario.merge! Hiragana.group3 if @level > 2
    #@silabario.merge! Hiragana.group4 if @level > 3
    #@silabario.merge! Hiragana.group4 if @level > 4
    #@silabario.merge! Hiragana.group5 if @level > 5
    #@silabario.merge! Hiragana.group6 if @level > 6
    levels = (1..@level).to_a
    @silabario = Hiragana.groups(levels)

    @keys = @silabario.keys
  end

  def self.show_help(level=1)
    Hiragana.show_help(level)
  end

  def run
    Debug.puts_line
    while @score < @max_score
      guess_japanise_symbol(@keys)
    end
  end

  private

  def guess_japanise_symbol(keys)
    keys.shuffle!
    good = keys[0].clone
    options = [ keys[0], keys[1], keys[2], keys[3] ].shuffle

    japanises = options.map { @silabario[_1] }
    progress = "[ #{@score}/#{@max_score} ]"
    print  "#{progress.white} #{japanises.join(', ')} #{good.to_s.light_yellow}? (1,2,3,4) "

    index = STDIN.gets.to_i
    exit if index.zero?
    if good == options[(index - 1)]
      @score += 1
      return true
    end
    puts "La respuesta es #{@silabario[good]}".light_red
    false
  end
end
