class ChangeColumnToAllowNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :first_interviews, :injury_date, true
  end

  def down
    change_column_null :first_interviews, :injury_date, false
  end
end
