namespace :import_data do

  desc "improt pharmacies to database"
  task :pharmacy, [:file] => :environment do
     # Step 1. read importing JSON data
     pharmacies_list = JSON.parse(File.read('./data/pharmacies.json'))
     puts pharmacies_list.count
  end

  desc "import users to datebase"
  task :user, [:file] => :environment do |task, args|
    users_list = JSON.parse(File.read('./data/users.json'))
     puts users_list.count
  end
  
end