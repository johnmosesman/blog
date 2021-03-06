require "test_helper"

class Api::PostsControllerTest < ActionController::TestCase
  def test_index
    get :index, { user_id: users(:one).id }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    # Compare what the controller returned to the posts user one has.
    json = JSON.parse(response.body)
    post_json = json["posts"].first

    the_post = posts(:one)
    assert_equal the_post.id, post_json["id"]
    assert_equal the_post.body, post_json["body"]
    assert_equal the_post.author, post_json["author"]
  end

  def test_create
    assert_difference "Post.count" do
      post :create, { post: { body: 'some body', author: 'some author', user_id: users(:one).id } }
    end

    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  def test_create_with_invalid_parameters
    assert_no_difference "Post.count" do
      post :create, { post: { body: nil, author: nil, user_id: nil } }
    end

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end

  def test_update
    the_post = posts(:one)

    assert_no_difference "Post.count" do
      put :update, { id: the_post.id, post: { body: 'new body', author: 'new author', user_id: 5 } }
    end

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    the_post.reload
    assert_equal 'new body', the_post.body
    assert_equal 'new author', the_post.author
    assert_equal 5, the_post.user_id
  end

  def test_update_with_invalid_parameters
    the_post = posts(:one)

    assert_no_difference "Post.count" do
      put :update, { id: the_post.id, post: { body: nil, author: nil, user_id: nil } }
    end

    assert_response :unprocessable_entity
    assert_equal Mime::JSON, response.content_type
  end
end
