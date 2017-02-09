class ChangeUrlTagToTagging < ActiveRecord::Migration
  def change
    rename_table :url_tags, :taggings
  end
end
