class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authorized_to_modify_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/login'
    else
      render :new
    end
  end

  def show
    @requests = Request.show_requests(@user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def contractors
    @contractors = User.contractor
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

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def authorized_to_modify_user
    if !@user 
      flash[:unauthorized] = "You are not authorized to modify this user."
      redirect_to '/'
    end
  end
end