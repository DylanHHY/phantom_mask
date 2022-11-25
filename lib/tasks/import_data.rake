namespace :import_data do
  desc 'improt pharmacies to database'
  task :pharmacy, [:file] => :environment do
    FILE_PATH_PHARMACY = './data/pharmacies.json'
    pharmacies_list = JSON.parse(File.read(FILE_PATH_PHARMACY))
    pharmacies_list.each do |row|
      pharmacy_name = row['name']
      cashBalance = row['cashBalance']
      # openingHours = row['openingHours']
      masks = row['masks']
      pharmacy = Pharmacy.new(name: pharmacy_name, cash_balance: cashBalance,)
      pharmacy.save
      masks[0].each do |mask|
        pharmacy_item = Pharmacy.find_by(name: pharmacy_name)
        # p pharmacy_item
        mask_name = mask[0]
        mask_price = mask[1]
        mask = pharmacy_item.masks.new(name: mask_name, price: mask_price)
        mask.save
      end
    end
  end

  desc 'import users to datebase'
  task :user, [:file] => :environment do
    FILE_PATH_USER = './data/users.json'
    users_list = JSON.parse(File.read(FILE_PATH_USER))
    users_list.each do |row|
      user_name = row['name']
      cash_balance = row['cashBalance']
      purchase_histories = row['purchaseHistories']
      # p purchase_histories
      # user = User.create(name: user_name, cash_balance: cash_balance)
      purchase_histories[0].each do |record|
        user_item = User.find_by(name: user_name)
        # pharmacy_name = purchase_histories[0]
        # mask_name = purchase_histories[1]
        # transaction_date = purchase_histories[3]
        # p user_item
      end
    end
  end

end