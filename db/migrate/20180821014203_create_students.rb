class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :birth_date
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
