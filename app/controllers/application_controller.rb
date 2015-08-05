class ApplicationController < ActionController::Base
  before_action :authenticate_user_from_token!

  respond_to :json

  private

  def authenticate_user_from_token!
    token = request.headers['Authorization']

    if token
      authenticate_with_token(token)
    else
      authentication_error
    end
  end

  def authenticate_with_token(token)
    unless token.include?(':')
      authentication_error
      return
    end

    user_id = token.split(':').first
    user = User.where(id: user_id).first

    if user && Devise.secure_compare(user.access_token, token)
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    render json: { error: 'Unauthorized' }, status: 401
  end
end
