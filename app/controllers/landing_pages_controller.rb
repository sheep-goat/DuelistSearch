class LandingPagesController < ApplicationController
  def home
    @user = current_user if logged_in?
    @latest_posts = Post.latest_record
  end
end
