# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base

  validates :short_url, :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tags,
    through: :taggings,
    source: :tag_topic

  def self.random_code
    url = SecureRandom.urlsafe_base64
    while exists?(short_url: url)
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.shorten(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: short_url
    )
  end

  def num_clicks
    self.visits.size
  end

  def num_uniques
    visitors.size
  end

  def num_recent_uniques
    visits.select do |visit|
      visit.created_at > 10.minutes.ago
    end.map(&:user_id).uniq.size
  end

end
