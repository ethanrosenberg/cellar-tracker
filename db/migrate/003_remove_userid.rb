class RemoveUserid < ActiveRecord::Migration[5.2]
  def change
    
      remove_column :wines, :user_id

  end
end
