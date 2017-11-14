class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :applies
  has_many :feedbacks
  has_many :bookmark_likes
  has_many :reward_benefits
end
