class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    post = Post.find(params[:id])
    fav = current_user.favorites.new(post_id: post.id)
    fav.save
    @fav_users = Favorite.where(post_id: params[:id]).count
  end

  def destroy
    fav = current_user.favorites.find_by(post_id: params[:id])
    fav.destroy
    @fav_users = Favorite.where(post_id: params[:id]).count
  end

  private

  def set_variables
    @post = Post.find(params[:id])
    @fav_link_id = "#fav-link-#{@post.id}"
  end
end
