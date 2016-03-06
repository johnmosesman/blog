require "test_helper"

class PostTest < ActiveSupport::TestCase
  def test_valid
    assert posts(:one).valid?
    refute Post.new.valid?
  end
end
