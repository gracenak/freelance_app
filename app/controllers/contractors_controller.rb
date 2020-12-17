class ContractorsController < ApplicationController

    def new
        @contractor = Contractor.new
      end
    
      def create
        @contractor = Contractor.new(contractor_params)
        if @contractor.save
            session[:contractor_id] = @contractor.id
            redirect_to contractor_path(@contractor)
        else
          render :new
        end
    
      end
    
      def show
        @contractor = Contractor.find(params[:id])
        redirect_to '/' if !@contractor
    
      end
    
      def edit
        @contractor = Contractor.find(params[:id])
      end
    
    
      def update
        @contractor = Contractor.find(params[:id])
        @contractor.update(contractor_params)
        redirect_to contractor_path(@contractor)
      end
    
      private
    
      def contractor_params
        params.require(:contractor).permit(
          :first_name,
          :last_name,
          :email
        )
      end
end
