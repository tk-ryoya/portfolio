class CreateRepeateInterviews < ActiveRecord::Migration[7.0]
  def change
    create_table :repeate_interviews do |t|
      t.integer :condition, null: false, default: 0
      t.string :description

      t.timestamps
    end
  end
end
