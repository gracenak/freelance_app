class GigsController < ApplicationController

    def index
        @gigs = Gig.all
    end

    def show
        @gig = Gig.find(params[:id])
    end

    def new
        @gig = Gig.new
        @gig.instruments.build
        @gig.users.build
    end

    def create
        @gig = Gig.new(gig_params)
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
        @gig.update
        redirect_to gig_path(@gig)
    end

    private

    def gig_params
        params.require(:gig).permit(:title, :datetime, :description, :payment, instrument_ids: [], instruments_attributes: [:name])
    end

end
