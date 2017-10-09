class DriversController < ApplicationController
    
    def index
        @drivers = Driver.all
        respond_to do |format|
          format.html
          format.json {render json: @drivers }
        end
    end
    
    def rides
        session['driver_id'] = params[:id]
    end
end
