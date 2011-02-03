#!/usr/bin/env ruby
require "./roman"
require "test/unit"

class TestRoman < Test::Unit::TestCase

  def test_conversion_to_roman_numerals_works
     filename = 'digits-numerals.txt'
    numbers = []
    numerals = []

    num_file = File.open(filename)
    num_file.each_line do |line|
        number, numeral = line.split(/\t/)
        numbers.insert(numbers.length, number.chomp.to_i)
        numerals.insert(numerals.length, numeral.chomp)
    end
       
    numerals.each_with_index{ |numeral,index|
        assert_equal(numerals[index],numbers[index].to_roman)
    }
 end
  
  def test_out_of_bounds_conversions_to_roman_fail
    assert_equal(nil, 10001.to_roman)
    assert_equal(nil, 5000.to_roman)
    assert_equal(nil, 0.to_roman)
    assert_equal(nil, -3.to_roman)
  end

  def test_string_conversions_from_roman_works
    assert_equal(1999, 'MCMXCIX'.from_roman)
    assert_equal(49, 'XLIX'.from_roman)
    assert_equal(14, 'XIV'.from_roman)
    assert_equal(2, 'II'.from_roman)
  filename = 'digits-numerals.txt'
    numbers = []
    numerals = []

    num_file = File.open(filename)
    num_file.each_line do |line|
        number, numeral = line.split(/\t/)
        numbers.insert(numbers.length, number.chomp.to_i)
        numerals.insert(numerals.length, numeral.chomp)
    end
       
    numerals.each_with_index{ |numeral,index|
        assert_equal(numbers[index],numerals[index].from_roman)
    }

  end
  
  def test_non_roman_strings_fail
    assert_equal(nil, 'ii'.from_roman)
    assert_equal(nil, 'LKD'.from_roman)
    assert_equal(nil, '2010'.from_roman)
    assert_equal(nil, 'XX!'.from_roman)
  end

end
