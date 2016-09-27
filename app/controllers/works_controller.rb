class WorksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @works = @user.works.order("created_at DESC")
    render json: @works
  end

  def show
    @user = User.find(params[:user_id])
    @works = @user.works
    @work = @works.find(params[:id])
    render json: @work
  end

  def create
    @work = Work.new work_params

    if @work.save
      @user = User.find(params[:user_id])
      @works = @user.works

      render json: @works.order("created_at DESC")
    else
      render json: { error: ('incorrect input') }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:user_id])
    @works = @user.works
    @work = @works.find(params[:id])

    if @work.update(work_params)
      render json: @works
    else
      render json: { error: ('incorrect data') }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @works = @user.works
    @work = @works.find(params[:id])

    @work.destroy

    render json: @works.order("created_at DESC")
  end

  private
  def work_params
    params.require(:work).permit(:user_id, :title, :description)
  end
end
