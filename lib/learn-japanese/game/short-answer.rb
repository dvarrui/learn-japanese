#!/usr/bin/env ruby

require_relative "../debug"
require_relative "../data/hiragana"

module Game
  class ShortAnswer
    def initialize(max = 10)
      @hiragana = Hiragana.new
  
      @score = 1
      @max_score = max
    
      @keys = @hiragana.keys
    end
  
    def show_help
      @hiragana.show_help
    end
  
    def run
      @hiragana.show_help
      Debug.puts_line
      while @score < @max_score
        @keys.shuffle!
        guess_japanise_symbol(@keys[0])
      end
    end
  
    private
  
    def guess_japanise_symbol(key)
      japanise = @silabario[key]
      progress = "[ #{@score}/#{@max_score} ]"
      print "#{progress.white} #{japanise.light_yellow} ? "
  
      resp = $stdin.gets.chomp
      exit if resp.empty?
      if resp == key.to_s
        @score += 1
        return true
      end
      puts "La respuesta es #{key}".light_red
      false
    end
  end
end
