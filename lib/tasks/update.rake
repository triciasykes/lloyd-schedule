namespace :update do
	desc "populated the database tables"
	task import_all: :environment do
		Rake::Task['populate:technicians'].invoke
		Rake::Task['populate:locations'].invoke
		Rake::Task['populate:work_orders'].invoke
	end	
end