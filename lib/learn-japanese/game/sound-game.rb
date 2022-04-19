
require_relative '../hiragana'
require_relative '../dictionary'
require 'colorize'

module SoundGame

  def self.to_hiragana(sounds)
    hiraganas = Hiragana.all

    hiragana_array = sounds.map { hiraganas[_1.to_sym] || '*' }
    hiragana = hiragana_array.join('')

    none = {'hiragana': hiragana, 'spanish': '?', 'sounds': '?'}
    words = Dictionary.new.words
    word = (words.select {_1["hiragana"] == hiragana})[0] || none

    word
  end

  def self.run
    sounds = "init"
    until sounds.empty?
      puts "[ Sounds to Hiragana ] Example: a i => あい （amor - ái）".white
      print "  Write sounds ? ".light_yellow
      sounds = STDIN.gets.chomp.split
      word = self.to_hiragana(sounds)
      puts "  Hiragana    => #{word["hiragana"]}".cyan
      puts "  Spanish     => #{word["spanish"]}".cyan
      puts "  Pronounce   => #{word["sounds"]}".cyan
    end
  end

end
