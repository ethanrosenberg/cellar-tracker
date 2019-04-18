class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth = request.env["omniauth.auth"]
     @user = User.find_or_create_by_omniauth(auth)
     session[:user_id] = @user.id

     redirect_to root_path
    else
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new
      end
    end

  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
