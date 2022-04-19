class WorkOrder < ApplicationRecord
    belongs_to :technician
    belongs_to :location

    def as_json(options ={})
        super(options).merge({
          location: location
        })
    end
end
