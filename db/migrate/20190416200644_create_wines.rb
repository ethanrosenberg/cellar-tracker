class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.integer :vintage
      t.integer :user_id

      t.timestamps
    end
  end
end
