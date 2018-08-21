class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
      t.string :type
      t.text :comment
      t.references :enrollment

      t.timestamps
    end
  end
end
