class UsersController < ApplicationController
  before_action :authenticate_user_from_token, only: [:destroy, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new user_params

    if @user.save
      render json: @user, root: nil
    else
      render json: { error: ('Email in use') }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: { error: ('Email in use') }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    render json: { message: 'User was destroyed' }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :name)
  end

  def authenticate_user_from_token
    @user = User.find(params[:id])

    unless request.headers['authorization'] === @user.access_token
      render json: { error: 'Failed to confirm person' }
    end
  end
end