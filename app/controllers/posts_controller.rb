class PostsController < ApplicationController
  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(post_param)
    @post.user = current_user
    if @post.save
      redirect_to user_show_path(current_user.username)
    else
      redirect_to controller: 'posts', action: 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_param
    params.require(:post).permit(:title, :game_id, :schedule_date, :prefecture_id, :location, :max_participant, :desc)
  end
end