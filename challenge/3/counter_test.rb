#!/usr/bin/env ruby
require "./counter"
require "test/unit"

class TestCounter < Test::Unit::TestCase

  def test_word_count_works
    count = Counter.new("counter_test_file.txt")
    assert_equal(65,count.word_count)
  end
  
end
