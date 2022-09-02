class DeleteReservationInterviews < ActiveRecord::Migration[7.0]
  def change
    drop_table :reservation_interviews
  end
end
