require "test_helper"

class PostsSerializerTest < ActiveSupport::TestCase
  def test_fields
    serializer = Api::PostsSerializer.new(posts(:one))

    fields = [:id, :body, :author, :user_id]
    assert_equal fields, serializer.attributes.keys
  end
end
