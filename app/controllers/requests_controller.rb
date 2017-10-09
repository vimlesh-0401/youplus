class RequestsController < ApplicationController
    
    def index
        requests = Request.order(created_at: :desc)
       respond_to do |format|
            format.json { render json: requests , status: :ok}
        end 
    end
    
    def create
        req = Request.add_req(request_prams)
        respond_to do |format|
            if req.valid?
                format.json { render json: req , status: :ok}
            else
                format.json { render json: req.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def rides
        req = find_request
        respond_to do |format|
            if req.assign_driver(session[:driver_id])
                format.json { render json: req , status: :ok}
            else
                format.json { render json: req.errors, status: :unprocessable_entity }
            end
        end
    end
    
    private
        def request_prams
            params.require(:request).permit(:customer_id)
        end
        
        def find_request
            Request.find(params[:id])
        end
end
