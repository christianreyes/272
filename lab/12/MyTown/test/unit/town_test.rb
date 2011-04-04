require 'test_helper'

class TownTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Town.new.valid?
  end
end
