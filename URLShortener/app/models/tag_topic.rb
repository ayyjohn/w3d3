# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  tag        :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base
  has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: :Tagging

  has_many :short_urls,
    through: :taggings,
    source: :short_url

end
