class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :require_login!

  def require_login!
    return true if authenticate_token
    render json: { errors: [ { detail: 'Access denied' } ] }, status: 401
  end

  def current_user
    @current_user ||= authenticate_token
  end

  private
  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

end
