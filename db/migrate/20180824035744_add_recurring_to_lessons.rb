class AddRecurringToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :recurring, :text
  end
end
