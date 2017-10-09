class DriversController < ApplicationController
    
    before_action :invalidate_session, only: [:index]
    def index
        @drivers = Driver.all
        respond_to do |format|
          format.html
          format.json {render json: @drivers }
        end
    end
    
    def rides
        driver = Driver.find_by(id: params[:id])
        if driver.nil?
            redirect_to drivers_path()
        end
        session['driver_id'] = params[:id]
    end
    
    private
        def invalidate_session
            session['driver_id'] = nil
        end
end
