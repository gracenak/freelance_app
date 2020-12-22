class GigsController < ApplicationController
  before_action :require_login
  before_action :set_gig, only: [:show, :edit, :update, :destroy]

    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @gigs = @user.gigs
      else
        @gigs = Gig.all
      end
    end

    def show
      @request = Request.new
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @gig = @user.gigs.build
          else
            @gig = Gig.new
        end
        @gig.instruments.build
    end

    def create
        @gig = current_user.gigs.build(gig_params)
        if @gig.save
          flash[:success] = "Your gig has been created successfully!"
          redirect_to gig_path(@gig)
        else
          flash[:warning] = "#{@gig.errors.full_messages.to_sentence}."
          render :new
        end
      end

    def edit
    end

    def update
      @gig.update(gig_params) 
      redirect_to gig_path(@gig) 
    end

    def most_recent
      @gigs = Gig.most_recent
    end

    def destroy
      if @gig.destroy
        flash[:delete] = "Your gig has been deleted successfully."
        redirect_to user_path(current_user)
      else
        redirect_to gig_path(@gig)
      end
    end


    private

    def gig_params
        params.require(:gig).permit(
          :title, 
          :datetime, 
          :description, 
          :payment, 
          instrument_ids: [], 
          instruments_attributes: [:name]
        )
    end

    def set_gig
      @gig = Gig.find(params[:id])
    end

    def authorized_to_modify(gig)
      
    end
end
