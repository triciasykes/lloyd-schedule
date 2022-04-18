namespace :populate do
    desc "populate workorder table"
    task work_orders: :environment do
      require "csv"
  
      fields = %w{ id technician_id location_id time duration price }
      CSV.foreach('lib/csvs/work_orders.csv', headers: true, col_sep: ",") do |row|
       order = WorkOrder.new(row.to_hash.select { |k, v| fields.include?(k) })
       order.save!
          end
    end
  
    desc "populate technician table"
    task technicians: :environment do
      fields = %w{ id name }
       CSV.foreach('lib/csvs/technicians.csv', headers: true, col_sep: ",") do |row|
        tech = Technician.new(row.to_hash.select { |k, v| fields.include?(k) })
        tech.save!
      end
    end
  
    desc "populate location table"
    task locations: :environment do
      
      fields = %w{ id name city }
      CSV.foreach('lib/csvs/locations.csv', headers: true, col_sep: ",")do |row|
        location = Location.new(row.to_hash.select { |k, v| fields.include?(k) })
        location.save!
      end
    end
  
  end
  