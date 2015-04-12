class AddDetailsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :doctor_id, :integer
    add_column :appointments, :date, :datetime
    add_column :appointments, :time, :datetime
    add_column :appointments, :note, :text
  end
end
