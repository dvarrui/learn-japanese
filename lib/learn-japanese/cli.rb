require "thor"
require_relative "../learn-japanese"

class CLI < Thor
  map ["h", "-h", "--help"] => "help"

  map ["v", "-v", "--version"] => "version"
  desc "version", "Show the program version"
  def version
    LearnJapanese.show_version
  end

  map ["c", "-c", "--choose"] => "choose"
  option :level
  desc "choose [--level=NUMBER]", "Values 1-6"
  def choose
    level = options["level"].to_i
    LearnJapanese.choose(level)
  end

  map ["s", "-s", "--short"] => "short"
  option :level
  desc "short [--level=NUMBER]", "Values 1-6"
  def short
    level = options["level"].to_i
    LearnJapanese.short(level)
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
