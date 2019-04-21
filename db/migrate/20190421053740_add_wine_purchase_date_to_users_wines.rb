class AddWinePurchaseDateToUsersWines < ActiveRecord::Migration[5.2]
  def change
    add_column :users_wines, :purchase_date, :datetime
  end
end
