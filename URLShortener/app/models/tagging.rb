# == Schema Information
#
# Table name: url_tags
#
#  id         :integer          not null, primary key
#  url_id     :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ActiveRecord::Base
  belongs_to :tag_topic,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :TagTopic

  belongs_to :short_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl


end
