class AddEntryDetailsToWorkouts < ActiveRecord::Migration[6.0]
  def change
    add_column :workouts, :entry_details, :string
  end
end
