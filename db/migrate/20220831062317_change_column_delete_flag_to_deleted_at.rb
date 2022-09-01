class ChangeColumnDeleteFlagToDeletedAt < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :delete_flag, default: false, null: false
  end
end
