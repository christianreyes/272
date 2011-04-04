require 'test_helper'

class AttractionTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Attraction.new.valid?
  end
end
