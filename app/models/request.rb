class Request < ApplicationRecord
    belongs_to :location, optional: true
    belongs_to :driver, optional: true
    
    def self.add_req inputs
        req = Request.new(inputs)
        req_id = Request.maximum(:request_id)
        req_id = (req_id.nil? ? 5000 : req_id+1)
        req.request_at = Time.now
        req.status = 1
        req.save
        req
    end
    
    def assign_driver driver_id
        if driver_id.present?
            self.driver = Driver.find(driver_id)
            self.pickedup_at = Time.now
            self.status = 2
            return self.save
        else
            return false
        end
    end
end
