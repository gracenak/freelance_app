class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:omniauth, :new, :create]


  def omniauth #logs users in with omniauth
    user = User.find_or_create_by_omniauth(auth)

    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)  
    else
      # flash[:error] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
   
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid login credentials."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end


private

  def auth
    request.env['omniauth.auth']
  end
end
