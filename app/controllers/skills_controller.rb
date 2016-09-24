class SkillsController < ApplicationController
  before_action :authenticate_user_from_token, only: [:create, :destroy]

  def index
    @user = User.find(params[:user_id])
    @skills = @user.skills

    render json: @skills
  end

  def create
    @skill = Skill.new skill_params

    if @skill.save
      render json: User.find(params[:user_id]).skills
    else
      render json: { error: ('incorrect data') }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @achievements = @user.skills
    @achievement = @achievements.find(params[:id])

    @achievement.destroy

    render json: @achievements
  end

  private
  def skill_params
    params.require(:skill).permit(:user_id, :body)
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