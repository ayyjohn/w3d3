class CreateUrlTag < ActiveRecord::Migration
  def change
    create_table :url_tags do |t|
      t.integer :url_id, null: false
      t.integer :tag_id, null: false
      t.timestamps
    end

    add_index :url_tags, :url_id
    add_index :url_tags, :tag_id
  end
end
