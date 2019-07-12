class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to login_path
    else
      redirect_to action: 'new'
    end
  end

  def show
    @user = User.find_by!(username: params[:username])
    @post = Post.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_param)
    if @user.valid?
      @user.save
      redirect_to user_show_path(current_user.username)
    else
      redirect_to user_edit_path(current_user.username)
    end
  end

  private

  def user_param
    params.require(:user).permit(:username, :nickname, :email, :password, :password_confirmation)
  end
end
