#!/usr/bin/env ruby
require "./credit_cards"
require "test/unit"

class TestCounter < Test::Unit::TestCase

  def test_valid_VISA_2012_02
    card = CreditCard.new(4123456789012,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_AMEX_2012_02
    card = CreditCard.new(342345678901212,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_MAST_1
    card = CreditCard.new(5112345678909876,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_enRoute_1
    card = CreditCard.new(201412345678909,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_enRoute_2
    card = CreditCard.new(214912345678909,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_MAST_2
    card = CreditCard.new(5423456789012112,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_DISC_2
    card = CreditCard.new(6011123456789098,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_JCB_1
    card = CreditCard.new(3123456789098765,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_valid_JCB_2
    card = CreditCard.new(213145678909876,2012,12)
	assert_equal(true,card.valid?)
  end

  def test_valid_JCB_3
    card = CreditCard.new(180045678909876,2012,12)
	assert_equal(true,card.valid?)
  end
  
  def test_invalid_VISA_2012_02
    card = CreditCard.new(4123456789012,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_AMEX_2012_02
    card = CreditCard.new(342345678901212,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_MAST_1
    card = CreditCard.new(5112345678909876,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_enRoute_1
    card = CreditCard.new(201412345678909,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_enRoute_2
    card = CreditCard.new(214912345678909,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_MAST_2
    card = CreditCard.new(5423456789012112,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_DISC_2
    card = CreditCard.new(6011123456789098,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_JCB_1
    card = CreditCard.new(3123456789098765,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_JCB_2
    card = CreditCard.new(213145678909876,2000,12)
	assert_equal(false,card.valid?)
  end

  def test_invalid_JCB_3
    card = CreditCard.new(180045678909876,2000,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_VISA_too_many_digits
    card = CreditCard.new(41234567890123456789,2012,12)
	assert_equal(false,card.valid?)
  end
  
  def test_valid_VISA_expired_long_ago
    card = CreditCard.new(4123456789012,2002,12)
	assert_equal(false,card.valid?)
  end
  
  def test_invalid_date_past
    card = CreditCard.new(123456789,2010,02)
	assert_equal(false,card.valid?)
  end
  
end
