class AddRatingToUsersWines < ActiveRecord::Migration[5.2]
  def change
    add_column :users_wines, :rating, :integer
  end
end
