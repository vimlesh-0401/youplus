class CustomersController < ApplicationController
    before_action :invalidate_session, only: [:index]
    def index
        
    end
    
    private
        def invalidate_session
            session['driver_id'] = nil
        end
end
