
require_relative '../hiragana'
require_relative '../dictionary'
require_relative '../debug'
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
    Debug.puts_line
    puts "SOUNDS TO HIRAGANA".light_cyan
    puts "Example: a i => あい （amor - ái）".blue
    Debug.puts_line

    sounds = "init"
    until sounds.empty?
      print "\nWrite sounds ? ".light_yellow
      sounds = STDIN.gets.chomp.split
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
