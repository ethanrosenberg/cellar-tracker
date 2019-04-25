class AddIdToUsersWines < ActiveRecord::Migration[5.2]
  def change
    add_column :users_wines, :id, :primary_key
  end
end
