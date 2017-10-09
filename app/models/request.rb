class Request < ApplicationRecord
    
    belongs_to :location, optional: true
    belongs_to :driver, optional: true
    
    def self.add_req inputs
        req = Request.new(inputs)
        req_id = Request.maximum(:request_id)
        req_id = (req_id.nil? ? 5000 : req_id+1)
        req.request_at = Time.now
        req.request_id = req_id
        req.status = 1
        req.save
        req
    end
    
    def assign_driver driver_id
        if driver_id.present?
            dr = Driver.find(driver_id)
            return false if !dr.available
            self.driver = dr
            self.pickedup_at = Time.now
            self.status = 2
            self.save
            dr.update(available: false)
            self.send_after self.id
            return true
        else
            return false
        end
    end
    
    def complete
        Request.transaction do
            self.completed_at = Time.now
            self.status = 3
            self.save
            self.driver.update(available: true)
        end
    end
    
    def send_after work_id
        Thread.new(work_id) do
            sleep(60*5)
            req = Request.find_by(id: work_id)
            req.complete if req.present?
        end
    end
end
