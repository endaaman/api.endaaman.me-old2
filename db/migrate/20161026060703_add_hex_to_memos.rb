class AddHexToMemos < ActiveRecord::Migration[5.0]
  def change
    add_column :memos, :hex, :string, :null => false
  end
end
