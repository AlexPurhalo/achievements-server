class AchievementsController < ApplicationController
  before_action :authenticate_user_from_token, only: [:create, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @achievements = @user.achievements

    render json: @achievements
  end

  def show
    @user = User.find(params[:user_id])
    @achievements = @user.achievements
    @achievement = @achievements.find(params[:id])
    render json: @achievement
  end

  def create
    @achievement = Achievement.new achievement_params

    if @achievement.save
      render json: User.find(params[:user_id]).achievements
    else
      render json: { error: ('incorrect data') }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:user_id])
    @achievements = @user.achievements
    @achievement = @achievements.find(params[:id])

    if @achievement.update(achievement_params)
      render json: @achievements
    else
      render json: { error: ('incorrect data') }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @achievements = @user.achievements
    @achievement = @achievements.find(params[:id])

    @achievement.destroy

    render json: @achievements
  end

  private
  def achievement_params
    params.require(:achievement).permit(:user_id, :description)
  end

  def authenticate_user_from_token
    @user = User.find(params[:user_id])

    access_token = @user.access_token
    headers_content = request.headers['authorization']

    unless headers_content === access_token
      render json: { error: 'Failed to confirm person' }
    end
  end
end