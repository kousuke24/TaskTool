class SessionsController < ApplicationController
  skip_before_action :login_required, only: %i[new create]

  def new; end

  def create
    user = User.find_by(name: session_params[:name])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインしました'
      redirect_to user_path(current_user.id)
    else
      flash[:warning] = 'ログインできませんでした'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end

  private

  def session_params
    params.permit(:name, :password)
  end
end
