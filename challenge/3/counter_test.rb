#!/usr/bin/env ruby
require "./counter"
require "test/unit"

class TestCounter < Test::Unit::TestCase

  def test_word_count_works_file
    count = Counter.new("counter_test_file.txt")
    assert_equal(65,count.word_count)
  end

  def test_character_count_file
    count = Counter.new("counter_test_file.txt")
    assert_equal(265,count.character_count)
  end
  
  def test_1_word
    count = Counter.new("10.txt")
    assert_equal(1,count.word_count)
  end

  def test_10_char
    count = Counter.new("10.txt")
    assert_equal(10,count.character_count)
  end

  def test_2_word
    count = Counter.new("20.txt")
    assert_equal(2,count.word_count)
  end

  def test_20_char2
    count = Counter.new("20.txt")
    assert_equal(20,count.character_count)
  end

  def test_four_punct
    count = Counter.new("punct_test.txt")
    assert_equal(4,count.word_count)
  end

end
