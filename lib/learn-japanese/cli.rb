require 'thor'
require_relative '../learn-japanese'

class CLI < Thor
  map ['h', '-h', '--help'] => 'help'

  map ['v', '-v', '--version'] => 'version'
  desc 'version', 'Show the program version'
  def version
    LearnJapanese.show_version
  end

  map ['ca', '-ca', '--choose-answer', 'choose-answer'] => 'choose_answer'
  option :level
  desc 'choose-answer [--level=NUMBER]', 'Values 1-6'
  def choose_answer()
    level = options[:level].to_i
    LearnJapanese.choose_answer(level)
  end

  map ['sa', '-sa', '--short-answer', 'short-answer'] => 'short_answer'
  option :level
  desc 'short-answer [--level=NUMBER]', 'Values 1-6'
  def short_answer()
    level = options[:level].to_i
    LearnJapanese.short_answer(level)
  end

  map ['so', '-so', '--sound', 'sound'] => 'sound'
  desc 'sound', 'Util: Write sounds and show Hiragana'
  def sound
    LearnJapanese.sound
  end

  map ['ro', '-ro', '--romanji' ] => 'romaji'
  desc 'romaji', 'You have to Write Romaji for every Hiragana word'
  def romaji
    LearnJapanese.romaji
  end
end
