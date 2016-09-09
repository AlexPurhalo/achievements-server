class ApplicationController < ActionController::Base
  respond_to :json


  private
  def authenticate_with_auth_token auth_token
    unless auth_token.include?(':')
      authentication_error
      return
    end

    user_id = auth_token.split(':').first
    user = User.where(id: user_id).first

    if user && Devise.secure_compare(user.access_token, auth_token)
      # User can access
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    # User's token is either invalid or not in the right format
    render json: {error: "Failed authentication"}, status: 401  # Authentication timeout
  end
end
