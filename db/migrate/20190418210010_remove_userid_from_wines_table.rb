class RemoveUseridFromWinesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :wines, :user_id
  end
end
