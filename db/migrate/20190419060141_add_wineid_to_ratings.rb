class AddWineidToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :wine_id, :integer
  end
end
