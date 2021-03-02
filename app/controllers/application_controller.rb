class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if current_user == nil
      flash[:notice] = "ログインしてください"
      redirect_to new_session_path
    end
  end

  def update_user
    unless current_user.id == @user.id
      flash[:notice] = "操作権限がありません"
    redirect_to root_path
    end
  end

  def update_picture
    unless current_user.id == @picture.user.id
      flash[:notice] = "操作権限がありません"
    redirect_to root_path
    end
  end
  end
