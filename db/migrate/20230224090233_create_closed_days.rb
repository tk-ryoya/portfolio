class CreateClosedDays < ActiveRecord::Migration[7.0]
  def change
    create_table :closed_days do |t|
      t.date :date, null: false
      t.boolean :closed_days
      t.boolean :closed_days_pm

      t.timestamps
    end
  end
end
