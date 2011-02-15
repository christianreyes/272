require 'test_helper'

class ChoreTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Chore.new.valid?
  end
end
