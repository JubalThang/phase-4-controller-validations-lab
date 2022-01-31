class PostsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  def show
    post = Post.find(params[:id])
    
    render json: post, status: :ok
  end

  def update
    post = Post.find(params[:id])

    post.update(post_params)

    render json: post
  end

  def create 
    post = Post.create!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_unprocessable_entity(invalid)
    render json: {error: invalid.record.errors}, status: :unprocessable_entity
  end

end
