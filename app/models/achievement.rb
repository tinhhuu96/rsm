class Achievement < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :majors, presence: true
  validates :organization, presence: true
  validates :received_time, presence: true
end
