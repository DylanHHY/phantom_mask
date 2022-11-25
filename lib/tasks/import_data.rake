namespace :import_data do

  desc "improt pharmacies to database"
  task :pharmacy, [:file] => :environment do |task, args|
     # Step 1. read importing JSON data
     pharmacies_list = JSON.parse(File.read[:file])
  end

  desc "import users to datebase"
  task :user, [:file] => :environment do |task, args|
    puts "users!!!"
  end
end