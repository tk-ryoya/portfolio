class AddColumnDeletedAtToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :deleted_at, :datetime
  end
end
