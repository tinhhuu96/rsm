class Job < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :applies
  has_many :feedbacks
  has_many :bookmark_likes
  has_many :reward_benefits

  validates :content, presence: true
  validates :name, presence: true
  validates :level, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :position, presence: true
  validates :skill, presence: true

  scope :sort_lastest, ->{order(created_at: :desc)}
end
