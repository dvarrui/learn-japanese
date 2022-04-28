#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/dictionary'

class RomanjiGame

  def initialize(level=1, max=10)
    @level = level
    @score = 1
    @max_score = max

    @words = Dictionary.words
  end

  def run
    Debug.puts_line
    while @score < @max_score
      @words.shuffle!
      guess_romanji(@words.first)
    end
  end

  private

  def guess_romanji(data)
    hiragana = data['hiragana']
    spanish = data['spanish']
    sound = data['sound']
    progress = "[ #{@score}/#{@max_score} ]"

    print  "#{progress.white} Write Romanji for #{hiragana.light_yellow}: "
    resp = STDIN.gets.chomp

    exit if resp.empty?
    #require 'debug'; binding.break
    good = Hiragana.hiraganas_to_sound(hiragana.split(''))
    if resp == good
      Hiragana.hiraganas_to_sound(hiragana.split)
      @score += 1
      return true
    end
    puts "Right answer is #{good}".light_red
    puts data
    false
  end

end
