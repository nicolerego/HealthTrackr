class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :user_id
      t.string :name
      t.string :title
      t.string :phone
      t.string :alt_phone
      t.string :address

      t.timestamps null: false
    end
  end
end
