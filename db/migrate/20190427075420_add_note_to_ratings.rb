class AddNoteToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :note, :text
  end
end
