# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  email      :string           not null
#

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true


  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl
end
