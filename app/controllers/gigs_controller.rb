class GigsController < ApplicationController
  before_action :require_login

    def index
        @gigs = Gig.all
    end

    def show
      @gig = Gig.find(params[:id])
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
        @gig = Gig.find(params[:id])
    end

    def update
        @gig = Gig.find(params[:id])
        @gig.update(gig_params)
        redirect_to gig_path(@gig)
    end

    def most_recent
      @gigs = Gig.most_recent
    end

    def destroy
      @gig = Gig.find(params[:id])
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
end
