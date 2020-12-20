class RequestsController < ApplicationController
    before_action :require_login

    def show
        @request = Request.find(params[:id])
    end
    
    def create
        request = Request.create(request_params)
        if request.valid?
            redirect_to request_path(request)
        else
            flash[:error] = "Application submission failed. #{request.errors.full_messages.to_sentence}"
            redirect_to gig_path(request.gig)
        end
    end

    private

    def request_params
        params.require(:request).permit(:application, :gig_id, :user_id, user_attributes: [:email])
    end
end

