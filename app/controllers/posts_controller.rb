class PostsController < ApplicationController
  PAGE_PER = 15
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
    @fav_users = Favorite.where(post_id: params[:id]).count
    @total_parts = Participator.where(post_id: params[:id]).count
    @comments = @post.comments
    @comment = Comment.new
  end

  def search
    @game_list = Game.all
    query = request.query_parameters
    @post = Post.latest_record.page(params[:page]).per(PAGE_PER)
    unless query[:prefecture_id].nil?
      @post = Post.where(prefecture_id: query[:prefecture_id]).page(params[:page]).per(PAGE_PER)
    end
  end

  private

  def post_param
    params.require(:post).permit(:title, :game_id, :schedule_date, :prefecture_id,
                                 :location, :max_participant, :desc, :image_path, :tag_list)
  end
end
