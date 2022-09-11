class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :reservation_date, :date, null: false
    add_column :reservations, :reservation_time, :time, null: false
    add_column :reservations, :start_time, :datetime, null: false
  end
end
