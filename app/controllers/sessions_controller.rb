class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user and @user.authenticate(params[:password])
    else
      flash.now[:login_partial] = "unknown_email"
      render :new
    end
  end
end