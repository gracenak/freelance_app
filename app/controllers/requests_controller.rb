class RequestsController < ApplicationController

    def show
        @request = Request.find(params[:id])
    
    end

    def create
        request = Request.create(request_params)
        if request.valid?
            redirect_to request_path(request)
        end
    end

    private

    def request_params
        params.require(:request).permit(:name, :gig_id, :user_id, user_attributes: [:email])
    end
end


