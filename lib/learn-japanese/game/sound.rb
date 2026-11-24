require "colorize"
require_relative "../show"
require_relative "../chars/dictionary"
require_relative "../chars/hiragana"

module Game
  class Sound
    def initialize
      @hiragana = Chars::Hiragana.new
    end

    def to_hiragana(sounds)
      hiragana = @hiragana.sounds_to_hiragana(sounds)

      none = {"hiragana" => hiragana, "spanish" => "?", "sounds" => "?"}
      words = Chars::Dictionary.words
      words.select { _1["hiragana"] == hiragana }[0] || none
    end

    def run
      Show.line
      puts "SOUNDS TO HIRAGANA".light_cyan
      puts "Example: a i => あい （amor - ái）".white
      Show.line

      loop do
        print "\nWrite sounds ? ".light_yellow
        sounds = $stdin.gets.chomp.split
        return if sounds.empty?

        word = to_hiragana(sounds)
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
