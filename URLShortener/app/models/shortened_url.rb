# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  short_url :string           not null
#  long_url  :string           not null
#  user_id   :integer          not null
#


class ShortenedUrl < ActiveRecord::Base

  validates :short_url, :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true


  def self.random_code
    url = SecureRandom.urlsafe_base64
    while exists?(short_url: url)
      url = SecureRandom.urlsafe_base64
    end
    url
  end

  def self.shorten(user, long_url)
    ShortenedUrl.create!(user_id: user.id,
     long_url: long_url,
     short_url: ShortenedUrl.random_code
     )
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end