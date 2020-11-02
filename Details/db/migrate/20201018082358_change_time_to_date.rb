class ChangeTimeToDate < ActiveRecord::Migration[6.0]
  def up
    change_column :workouts, :date, :date
  end

  def down
    change_column :workouts, :date, :time
  end
end
