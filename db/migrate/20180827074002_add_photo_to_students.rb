class AddPhotoToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :photo, :string
  end
end
