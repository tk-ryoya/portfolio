class CreateFirstInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :first_interviews do |t|
      t.date :injury_date, null: false
      t.integer :injury_position, null: false, default: 0
      t.string :description

      t.timestamps
    end
  end
end
