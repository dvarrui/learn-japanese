#!/usr/bin/env ruby

require_relative "../debug"
require_relative "../data/hiragana"

module Game
  class ChooseAnswer
    def initialize(max = 10)
      @hiragana = Hiragana.new
      @score = 1
      @max_score = max    
    end
  
    def run
      @hiragana.show_help
      Debug.puts_line
      while @score < @max_score
        guess_japanise_symbol(@hiragana.data.keys.clone)
      end
    end
  
    private
  
    def guess_japanise_symbol(keys)
      keys.shuffle!
      good = keys[0].clone
      options = [keys[0], keys[1], keys[2], keys[3]].shuffle
  
      japanises = options.map { @hiragana.data[_1] }
      progress = "[ #{@score}/#{@max_score} ]"
      print "#{progress.white} #{japanises.join(", ")} #{good.to_s.light_yellow}? (1,2,3,4) "
  
      index = $stdin.gets.to_i
      exit if index.zero?
      if good == options[(index - 1)]
        @score += 1
        return true
      end
      puts "La respuesta es #{@hiragana.data[good]}".light_red
      false
    end
  end
end

