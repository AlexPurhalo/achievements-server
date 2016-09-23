class SkillsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @skills = @user.skills

    render json: @skills
  end
end