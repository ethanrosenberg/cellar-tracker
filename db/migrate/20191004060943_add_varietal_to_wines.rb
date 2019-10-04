class AddVarietalToWines < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :varietal, :string
  end
end
