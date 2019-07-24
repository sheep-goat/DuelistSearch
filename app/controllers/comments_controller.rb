class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_param)
    @comment.user = current_user
    @comment.post = Post.find(params[:id])
    redirect_back fallback_location: post_show_path(@comment.post.id, params[:id])
  end

  private

  def comment_param
    params.require(:comment).permit(:message)
  end
end
