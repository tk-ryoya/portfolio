class CreateReservationInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_interviews do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :interviewable, polymorphic: true

      t.timestamps
    end
  end
end
