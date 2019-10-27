class PostsController < ApplicationController
  before_action :require_login
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
    @assessments = @post.user.assessments.count_grade
    @fav_users = @post.favorites.count
    @total_parts = @post.participators.count
    @comments = @post.comments
    @comment = Comment.new
  end

  def search
    @game_list = Game.all
    query = request.query_parameters
    @post = Post.latest_record.paginate(params[:page])
    unless query[:prefecture_id].nil?
      @post = Post.where(prefecture_id: query[:prefecture_id]).paginate(params[:page])
    end
  end

  def tag
    @game_list = Game.all
    @post = Post.tagged_with(params[:tag_name]).paginate(params[:page]) if params[:tag_name]
    render action: :search
  end

  private

  def post_param
    params.require(:post).permit(:title, :game_id, :schedule_date, :prefecture_id,
                                 :location, :max_participant, :desc, :image_path, :tag_list)
  end
end
