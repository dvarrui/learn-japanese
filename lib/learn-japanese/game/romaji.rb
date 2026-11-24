#!/usr/bin/env ruby

require_relative "../show"
require_relative "../chars/dictionary"

module Game
  class Romaji
    def initialize(level = 1, max = 10)
      @level = level
      @score = 1
      @max_score = max

      @words = Chars::Dictionary.words
    end

    def run
      Show.line
      while @score < @max_score
        @words.shuffle!
        guess_romaji(@words.first)
      end
    end

    private

    def guess_romaji(data)
      hiragana = data["hiragana"]
      spanish = data["spanish"]
      sounds = data["sounds"]
      progress = "[ #{@score}/#{@max_score} ]"

      print "#{progress.white} Write Romaji for #{hiragana.light_yellow}: "
      resp = $stdin.gets.chomp
      exit if resp.empty?

      good = Chars::Hiragana.new.hiraganas_to_sound(hiragana.chars)
      if resp == good
        @score += 1
        puts " " * 9 + spanish.white
        return true
      end
      puts " " * 9 + "#{spanish} (#{sounds})".light_red
      false
    end
  end
end
