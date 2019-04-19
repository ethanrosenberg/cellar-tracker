class RemoveWineidfromRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :ratings, :wine_id
  end
end
