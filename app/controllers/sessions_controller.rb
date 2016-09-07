class SessionsController < ApplicationController
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_sign_in_attempt unless @user

    if @user.valid_password?(params[:password])
      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    else
      invalid_sign_in_attempt
    end
  end

  private
  def invalid_sign_in_attempt
    warden.custom_failure!
    render json: {error: ('Invalid password or email')}, status: :unprocessable_entity
  end
end