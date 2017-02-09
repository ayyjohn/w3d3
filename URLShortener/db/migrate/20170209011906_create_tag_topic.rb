class CreateTagTopic < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :tag, null: false
      t.timestamps
    end

    add_index :tag_topics, :tag
  end
end
