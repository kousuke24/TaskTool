class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを作成しました'
      redirect_to admin_user_path(@user)
    else
      flash.now[:warning] = 'ユーザーを作成できませんでした'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザーの登録情報を更新しました'
      redirect_to admin_user_path(@user)
    else
      flash[:warning] = 'ユーザーの登録情報を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'ユーザーを削除しました'
      redirect_to admin_users_path
    else
      flash[:warning] = 'ユーザーを削除できませんでした'
      render :edit, alert: ":"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :admin_flag)
  end

  def require_admin
    raise Forbidden unless current_user.admin_flag?
  end
end
