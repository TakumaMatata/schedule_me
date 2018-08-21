class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :language
      t.string :level
      t.references :term, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
