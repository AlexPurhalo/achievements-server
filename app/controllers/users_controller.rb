class UsersController < ApplicationController
  before_action :authenticate_user_from_token, only: [:destroy, :update]

  def index
    users = User.page(params[:page]).per(10)
    render  json: users, meta: { pagination: {
        per_page: 10,
        total_pages: users.total_count % 10 === 0? users.total_count / 10 : users.total_count / 10 + 1,
        total_objects: users.total_count
    } }
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
    params.require(:user).permit(:email, :password, :name, :picture, :profile, :age, :city, :skype, :mobile, :linkedin, :github)
  end

  def authenticate_user_from_token
    @user = User.find(params[:id])

    unless request.headers['authorization'] === @user.access_token
      render json: { error: 'Failed to confirm person' }
    end
  end
end