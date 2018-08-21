class RemoveDurationFromLesson < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :duration, :integer
  end
end
