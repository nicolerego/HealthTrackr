class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.integer :user_id
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at
      t.string :amount

      t.timestamps null: false
    end
  end
end
