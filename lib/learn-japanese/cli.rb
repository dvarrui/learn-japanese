require "thor"
require_relative "../learn-japanese"

class CLI < Thor
  map ["h", "-h", "--help"] => "help"

  map ["v", "-v", "--version"] => "version"
  desc "version", "Show the program version"
  def version
    LearnJapanese.show_version
  end

  map ["c", "-c", "--choose", "choose"] => "choose_answer"
  desc "choose", "Choose the right answer"
  def choose_answer
    LearnJapanese.choose
  end

  map ["s", "-s", "--short", "short"] => "short_answer"
  desc "short", "Write right answer"
  def short_answer
    LearnJapanese.short
  end

  map ["so", "-so", "--sound"] => "sound"
  desc "sound", "Util: Write sounds and show Hiragana"
  def sound
    LearnJapanese.sound
  end

  map ["r", "-r", "--romanji"] => "romaji"
  desc "romaji", "You have to Write Romaji for every Hiragana word"
  def romaji
    LearnJapanese.romaji
  end
end

CLI.start(ARGV)
