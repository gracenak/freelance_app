class SessionsController < ApplicationController

  def home

  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
   
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Invalid credentials."
      render :new
    end

  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
