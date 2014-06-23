# coding: utf-8
class SessionsController < ApplicationController
  before_action :require_login, only: :destroy
  skip_after_action :set_return_to_url

  def new
    redirect_to(admin_url) if current_user
  end

  def create
    if @user = login(params[:email], params[:password], true)
      redirect_to admin_url, notice: 'loginしました'
    else
      flash.now[:alert] = I18n.t('helpers.notices.wrong_email_or_password')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'ログアウトしました。'
  end
end
