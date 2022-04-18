#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'learn-japanese/hiragana'
require 'learn-japanese/dictionary'
require 'colorize'

puts "[ Sounds to Hiragana ] Example: a i => あい （amor - ái）".white

def sound_to_hiragana
  print "  Write sounds ? ".light_yellow
  sounds = gets.chomp.split
  hiraganas = Hiragana.all

  hiragana_array = sounds.map { hiraganas[_1.to_sym] || '*' }
  hiragana = hiragana_array.join('')

  words = Dictionary.new.words
  word = (words.select { _1["hiragana"] == hiragana})[0] || {'spanish': '?', 'sounds': '?'}

  puts "  Hiragana    => #{hiragana}".cyan
  puts "  Spanish     => #{word["spanish"]}".cyan
  puts "  Pronounce   => #{word["sounds"]}".cyan

  return false if sounds.size.zero?
  true
end

while sound_to_hiragana
end
