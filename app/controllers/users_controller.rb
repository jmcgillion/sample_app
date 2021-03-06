class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to 
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :avatar)
  end

  def feed
    Post.from_users_followed_by(self)
  end
end











