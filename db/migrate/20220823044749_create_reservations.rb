class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user,                 null: false, foreign_key: true
      t.integer    :reservation_type,     null: false, default: 0
      t.datetime   :reservation_datetime, null: false
      t.boolean    :delete_flag,          null: false, default: false

      t.timestamps
    end
  end
end
