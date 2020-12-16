class UsersController < ApplicationController

  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to '/login'
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])

  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :instrument,
      :bio,
      :contractor,
      :password
    )
  end
end
