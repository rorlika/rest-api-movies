class ApplicationController < ActionController::API
  private

  def current_user
    @current_user ||= User.find(params[:user_id])
  end
end
