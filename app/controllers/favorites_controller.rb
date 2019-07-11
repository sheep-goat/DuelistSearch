class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:id])
    fav = current_user.favorites.new(post_id: post.id)
    fav.save
  end

  def destroy
    fav = current_user.favorites.find_by(post_id: params[:id])
    fav.destroy
  end
end
