#!/usr/bin/env ruby

require 'test/unit'
require_relative '../../../lib/learn-japanese/data/hiragana'

class HiraganaTest < Test::Unit::TestCase

  def test_new
    h = Hiragana.new

    assert_equal 6, h.data.size
  end

  def test_every_group_has_6_symbols
    data = Hiragana.new.data

    data.each { |group| assert_equal 5, group.size }
  end
end
