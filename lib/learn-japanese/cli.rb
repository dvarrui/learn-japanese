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
  desc 'choose-answer [LEVEL]', 'LEVEL = 1-4'
  def choose_answer(level)
    LearnJapanese.choose_answer(level.to_i)
  end

  map ['sa', '-sa', '--short-answer', 'short-answer'] => 'short_answer'
  desc 'short-answer [LEVEL]', 'LEVEL = 1-4'
  def short_answer(level)
    LearnJapanese.short_answer(level.to_i)
  end

  map ['so', '-so', '--sound', 'sound'] => 'sound'
  desc 'sound', 'Write sounds and get the Hiragana'
  def sound
    LearnJapanese.sound
  end
end
