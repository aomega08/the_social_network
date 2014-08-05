class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.save

    redirect_to @post.postable
  end

  def post_params
    params.require(:post).permit(:content, :postable_type, :postable_id)
  end
end