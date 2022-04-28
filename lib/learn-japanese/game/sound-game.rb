
require 'colorize'
require_relative '../debug'
require_relative '../data/dictionary'
require_relative '../data/hiragana'

module SoundGame

  def self.to_hiragana(sounds)
    hiragana = Hiragana.sounds_to_hiragana(sounds)

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
