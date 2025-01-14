namespace :import_data do
  desc 'improt pharmacies to database'
  task :pharmacy, [:file] => :environment do
    FILE_PATH_PHARMACY = './data/pharmacies.json'
    pharmacies_list = JSON.parse(File.read(FILE_PATH_PHARMACY))
    pharmacies_list.each do |row|
      pharmacy_name = row['name']
      cashBalance = row['cashBalance']
      openingHours = row['openingHours']
      masks = row['masks']
      pharmacy = Pharmacy.new(name: pharmacy_name, cash_balance: cashBalance,) #opening_at: openingHours)
      pharmacy.save
      masks.each do |mask, value|
        pharmacy_item = Pharmacy.find_by(name: pharmacy_name)
        mask_name = mask["name"]
        mask_price = mask["price"]
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
      user = User.new(name: user_name, cash_balance: cash_balance)
      user.save
      purchase_histories.each do |record|
        user_item = User.find_by(name: user_name)
        pharmacy_name = record['pharmacyName']
        mask_name = record['maskName']
        transaction_amount = record['transactionAmount']
        transaction_date = record['transactionDate']
        record = user_item.purchase_histories.new(pharmacy_name: pharmacy_name, mask_name: mask_name, transaction_amount: transaction_amount, transaction_date: transaction_date)
        record.save
      end
    end
  end

end