class GigsController < ApplicationController

    def index
        @gigs = Gig.all
    end

    def show
        @gig = Gig.find(params[:id])
    end

    def new
        @gig = Gig.new
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

end
