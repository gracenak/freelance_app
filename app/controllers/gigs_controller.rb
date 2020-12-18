class GigsController < ApplicationController
    before_action :redirect_if_unauthorized

    def index
        @gigs = Gig.all
    end

    def show
        @gig = Gig.find(params[:id])
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @gig = @user.gigs.build
          else
            @gig = Gig.new
        end
    end

    def create
        # binding.pry
        @gig = current_user.gigs.build(gig_params)
        if @gig.save
          redirect_to gig_path(@gig)
        else
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

    def destroy
        self.find(params[:id]).destroy
        redirect_to user_path(current_user)
      end

    private

    def gig_params
        params.require(:gig).permit(:title, :datetime, :description, :payment, instruments_attributes: [:name])
    end

end
