class ApplicationController < ActionController::Base
  include PublicActivity::StoreController

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :authenticate

  def logged_in?
    !!current_user
  end

  def admin?
    current_user.role == 'admin'
  end

  def current_user
    if auth_present?
      user = User.find(auth["user"])
      if user
        @current_user ||= user
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  private

  def token
    request.env["HTTP_AUTHORIZATION"].scan(/Bearer(.*)$/).flatten.last.lstrip
  end

  def auth
    Auth.decode(token)
  end

  def auth_present?
    !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
  end
end
