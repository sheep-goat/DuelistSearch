class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_param)
    @comment.user = current_user
    @comment.post = Post.find(params[:id])
    if @comment.save
      redirect_to root_path
    end
  end

  private

  def comment_param
    params.require(:comment).permit(:message)
  end
end
