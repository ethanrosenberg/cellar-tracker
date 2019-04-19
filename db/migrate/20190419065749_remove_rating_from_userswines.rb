class RemoveRatingFromUserswines < ActiveRecord::Migration[5.2]
  def change
    remove_column :users_wines, :rating
  end
end
