class RequestsController < ApplicationController
    before_action :require_login
    before_action :set_gig, only: [:new, :create]

    def show
       @request = Request.find_by(id: params[:id])
    end

    def new
        @request = @gig.requests.build
    else
            @request = Request.new
        end
    end

    def create
        @request = current_user.requests.build(request_params)
        if @request.save 
            redirect_to request_path(@request)
        else
            flash[:error] = "Application submission failed. #{@request.errors.full_messages.to_sentence}"
            redirect_to gig_path(@request.gig)
        end
    end


    private

    def request_params
        params.require(:request).permit(:application, :gig_id, :user_id, user_attributes: [:email])
    end

    def set_gig
        @gig = Gig.find_by(id: params[:gig_id])
    end
end

