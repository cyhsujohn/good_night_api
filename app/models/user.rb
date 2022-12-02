class User < ApplicationRecord
  validates :name, presence: true

  has_many :duration_of_sleeps
  has_many :clock_ins
  has_many :following_records, foreign_key: :follower_id, class_name: "FollowRecord"
  has_many :followees, through: :following_records
  has_many :followed_records, foreign_key: :followee_id, class_name: "FollowRecord"
  has_many :followers, through: :followed_records
end
