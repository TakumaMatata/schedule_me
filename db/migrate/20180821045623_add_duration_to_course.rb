class AddDurationToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :duration, :integer
  end
end
