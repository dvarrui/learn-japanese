#!/usr/bin/env ruby

require_relative '../debug'
require_relative '../data/dictionary'
require_relative '../data/hiragana'

class RomajiGame

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
      guess_romaji(@words.first)
    end
  end

  private

  def guess_romaji(data)
    hiragana = data['hiragana']
    spanish = data['spanish']
    sounds = data['sounds']
    progress = "[ #{@score}/#{@max_score} ]"

    print  "#{progress.white} Write Romanji for #{hiragana.light_yellow}: "
    resp = STDIN.gets.chomp
    exit if resp.empty?

    good = Hiragana.new.hiraganas_to_sound(hiragana.split(''))
    if resp == good
      @score += 1
      puts ' ' * 9 + "#{spanish} (#{sounds})".white
      return true
    end
    puts "Right answer is #{good}".light_red
    puts ' ' * 9 + "#{spanish} (#{sounds})".red
    false
  end

end
