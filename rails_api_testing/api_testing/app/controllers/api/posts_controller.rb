class Api::PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])  # Simplified example
    render json: @posts, status: :ok, each_serializer: Api::PostsSerializer
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :ok, each_serializer: Api::PostsSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      render json: @post, status: :ok, serializer: Api::PostsSerializer
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:body, :author, :user_id)
    end
end
