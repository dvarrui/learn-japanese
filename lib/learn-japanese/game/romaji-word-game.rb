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
      @words.shuffle!
      guess_romanji(@words[1,4])
    end
  end

  private

  def guess_romanji(data)
    hiragana = data[:hiragana]
    spanish = data[:spanish]
    sound = data[:sound]
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


  require 'colorize'
  require_relative '../debug'
  require_relative '../data/dictionary'
  require_relative '../data/hiragana'

  module SoundGame

    def self.to_hiragana(sounds)
      hiraganas = Hiragana.all

      hiragana_array = sounds.map { hiraganas[_1.to_sym] || '*' }
      hiragana = hiragana_array.join('')

      none = {'hiragana' => hiragana, 'spanish' => '?', 'sounds' => '?'}
      words = Dictionary.words
      word = (words.select {_1["hiragana"] == hiragana})[0] || none

      word
    end

    def self.run
      Debug.puts_line
      puts "SOUNDS TO HIRAGANA".light_cyan
      puts "Example: a i => あい （amor - ái）".blue
      Debug.puts_line

      loop do
        print "\nWrite sounds ? ".light_yellow
        sounds = STDIN.gets.chomp.split
        return if sounds.empty?

        word = self.to_hiragana(sounds)
        print "Hiragana    => ".white
        puts word["hiragana"]
        print "Spanish     => ".white
        puts word["spanish"]
        print "Pronounce   => ".white
        puts word["sounds"]
      end
    end

  end

end
