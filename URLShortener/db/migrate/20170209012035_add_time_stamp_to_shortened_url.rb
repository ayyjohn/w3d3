class AddTimeStampToShortenedUrl < ActiveRecord::Migration
  def change
     change_table(:shortened_urls) { |t| t.timestamps }
  end
end
