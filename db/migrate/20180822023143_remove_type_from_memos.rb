class RemoveTypeFromMemos < ActiveRecord::Migration[5.2]
  def change
    remove_column :memos, :type, :string
  end
end
