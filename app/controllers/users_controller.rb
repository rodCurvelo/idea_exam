class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = 'User was successfully created!'
      redirect_to '/' 
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    @ideas = Idea.where(user_id: @user.id).count
    @likes = Like.where(user_id: @user.id).count
  end

  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :alias, :email, :password, :password_confirmation)
  end
end
