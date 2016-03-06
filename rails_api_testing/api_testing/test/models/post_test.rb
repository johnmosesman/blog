require "test_helper"

class PostTest < ActiveSupport::TestCase
  def test_valid
    assert posts(:one).valid?
    refute Post.new.valid?
  end

  def test_some_method
    # assert_equal 'something', posts(:one).some_method
  end

  def test_for_user
    assert_equal [posts(:one)], Post.for_user(users(:one).id)
    assert_equal [posts(:two)], Post.for_user(users(:two).id)
  end
end
