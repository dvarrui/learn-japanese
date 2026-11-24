require_relative "learn-japanese/version"
require_relative "learn-japanese/data/hiragana"
require_relative "learn-japanese/game/choose"
require_relative "learn-japanese/game/short"
require_relative "learn-japanese/game/sound"
require_relative "learn-japanese/game/romaji"

module LearnJapanese
  def self.show_version
    puts "#{LearnJapanese::NAME} (version #{LearnJapanese::VERSION})"
  end

  def self.show_help
    puts "Usage: learn-japanese --help"
    exit 0
  end

  def self.choose
    Game::ChooseAnswer.new.run
  end

  def self.hiragana
    Data::Hiragana.new.show
  end

  def self.romaji
    Game::Romaji.new.run
  end

  def self.short
    Game::ShortAnswer.new.run
  end

  def self.sound
    Game::Sound.new.run
  end
end
