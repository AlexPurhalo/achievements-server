class UsersController < ApplicationController
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

  def destroy
    @user = User.find(params[:id])

    if request.headers['authorization'] === @user.access_token
      @user.destroy
      render json: { message: 'User was destroyed' }
    else
      render json: { error: 'Failed to confirm person' }
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end