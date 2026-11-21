#!/usr/bin/env ruby

require "test/unit"
require_relative "../../../lib/learn-japanese/data/hiragana"

class HiraganaTest < Test::Unit::TestCase
  def test_new
    h = Hiragana.new

    assert_equal 107, h.data.size
  end
end
