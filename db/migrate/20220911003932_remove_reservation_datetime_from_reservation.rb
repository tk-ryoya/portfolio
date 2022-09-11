class RemoveReservationDatetimeFromReservation < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :reservation_datetime, :datetime
  end
end
