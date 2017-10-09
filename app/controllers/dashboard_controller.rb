class DashboardController < ApplicationController
    
    before_action :invalidate_session
    
    def index
        @requests = Request.order(status: :asc)
        respond_to do |format|
          format.html
          format.json {render json: @requests }
        end
    end
    
    private
        def invalidate_session
            session[:driver_id] = nil
        end
end
