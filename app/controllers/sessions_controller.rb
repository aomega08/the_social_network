class SessionsController < ApplicationController
  skip_before_filter :ensure_loggedin, except: :destroy
  before_action :ensure_not_loggedin, except: :destroy

  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user
      if @user.authenticate(params[:password])
        login(@user, params[:remember])
      
        if params[:next]
          redirect_to params[:next]
        else
          redirect_to home_url
        end
      else
        flash.now[:login_partial] = "wrong_password"
        render :new
      end
    else
      flash.now[:login_partial] = "unknown_email"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end