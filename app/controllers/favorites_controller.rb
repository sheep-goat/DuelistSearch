class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:id])
    fav = current_user.favorites.new(post_id: post.id)
    fav.save
  end
end
