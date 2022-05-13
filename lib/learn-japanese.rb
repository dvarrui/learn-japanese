
require_relative 'learn-japanese/version'
require_relative 'learn-japanese/game/choose-answer-game'
require_relative 'learn-japanese/game/short-answer-game'
require_relative 'learn-japanese/game/sound-game'
require_relative 'learn-japanese/game/romaji-game'

module LearnJapanese

  def self.show_version
    puts "#{LearnJapanese::NAME} (version #{LearnJapanese::VERSION})"
  end

  def self.show_help
    puts "Usage: learn-japanese --help"
    exit 0
  end

  def self.choose_answer(level)
    show_help unless level > 0
    ChooseAnswerGame.show_help(level)
    ChooseAnswerGame.new(level).run
  end

  def self.short_answer(level)
    show_help unless level > 0
    ShortAnswerGame.show_help(level)
    ShortAnswerGame.new(level).run
  end

  def self.sound
    SoundGame.run
  end

  def self.romaji
    RomajiGame.new.run
  end
end
