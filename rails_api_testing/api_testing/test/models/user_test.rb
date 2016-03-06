require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_valid
    assert users(:one).valid?
    refute User.new.valid?
  end
end
