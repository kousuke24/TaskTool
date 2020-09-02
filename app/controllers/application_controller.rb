class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: ENV['BASIC_AUTH_NAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env.production?
  helper_method :current_user
  before_action :login_required

  class Forbidden < ActionController::ActionControllerError; end
  rescue_from Forbidden, with: :rescue403

  rescue_from Exception, with: :rescue500
  rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  rescue_from ActionController::RoutingError, with: :rescue404

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  # ユーザーの情報を取得するメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ユーザーがログインしていない場合、ログインページに処理を飛ばすメソッド
  def login_required
    redirect_to login_url unless current_user
  end

  # 403エラー時に表示する画面
  def rescue403
    render file: 'public/403.html', status: 403, layout: false
  end

  def rescue404
    render 'errors/404', status: :not_found
  end
 
  def rescue500
    render 'errors/500', status: :internal_server_error
  end
end
