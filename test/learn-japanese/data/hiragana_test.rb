#!/usr/bin/env ruby

require "test/unit"
require_relative "../../../lib/learn-japanese/chars/hiragana"

class HiraganaTest < Test::Unit::TestCase
  def test_new
    h = Chars::Hiragana.new

    assert_equal 107, h.data.size
  end
end
