class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

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
      flash[:message] = "#{@user.errors.full_messages.to_sentence}."
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    # @request = Request.find_by(gig_id: @user.gigs)
    @requests = Request.where(gig_id: @user.gigs)
    # redirect_to '/' if !@user
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    redirect_to '/' unless @user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:update] = "#{@user.errors.full_messages.to_sentence}"
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
end