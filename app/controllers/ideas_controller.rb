class IdeasController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    # get all ideas only, without the likes
    all_ideas = Idea.all
    # get all ideas joined by the likes table and ordering them by the likes count
    liked_ideas = Idea.joins(:likes).group(:idea_id).order("count(likes.idea_id) DESC")
    #@ideas = Idea.all
    @ideas = liked_ideas | all_ideas

    @likes = Like.all
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = 'Idea Posted!' 
      redirect_to :back
    else
      flash[:errors] = @idea.errors.full_messages 
      redirect_to :back
    end
  end

  def show
    @user = User.find(session[:user_id])
    @idea = Idea.find(params[:id])
    @likes = Like.all
  end

  def destroy
    Idea.find(params[:id]).destroy
    redirect_to :back
  end

  private 

  def idea_params
    params.require(:idea).permit(:idea, :user_id)
  end
end