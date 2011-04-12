#!/usr/bin/env ruby
require "./knight"
require "test/unit"

class TestKnight < Test::Unit::TestCase

  def test_A8_to_B7_forb_B6
	assert_equal(["C7","B5","D6","B7"],knights_travails("A8","B7", "B6"))
  end
	
  def test_A8_to_G6_forb_B6_C7
	assert_equal(nil,knights_travails("A8","G6", "B6", "C7"))
  end
  
  def test_A8_to_G5
	assert_equal(["C7","E6","G5"],knights_travails("A8","G5"))
  end
  
  def test_A1_to_H8
	assert_equal(["C2", "D4", "F5", "H6", "F7", "H8"],knights_travails("A1","H8"))
  end
  
  def test_A8_to_H3
	assert_equal(["C7", "D5", "F4", "H3"],knights_travails("A8","H3"))
  end
  
  def test_A8_to_H3_forb_H3
	assert_equal(nil,knights_travails("A8","H3", "H3"))
  end
  
  def test_A1_to_H1
	assert_equal(["B3", "C1", "D3", "F2", "H1"],knights_travails("A1","H1"))
  end
  
  def test_A3_to_D6
	assert_equal(["D5", "F4", "G2"],knights_travails("C7","G2"))
  end
  
  def test_A3_to_F8
	assert_equal(["B5", "C7", "E6", "F8"],knights_travails("A3","F8"))
  end
  
  def test_G1_to_G2
	assert_equal(["E2", "F4", "G2"],knights_travails("G1","G2"))
  end
  
end
