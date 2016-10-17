class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.string :slug, :null => false
      t.string :title, :null => false
      t.string :digest, :null => false, :default => ''
      t.boolean :hidden, :null => false, :default => false
      t.boolean :draft, :null => false, :default => false
      t.text :image_url, :null => false
      t.text :content, :null => false

      t.index :slug, unique: true
      t.timestamps
    end
  end
end
