class PostCommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post = post.id
    comment.save
    redirect_to root_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
