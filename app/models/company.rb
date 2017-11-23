class Company < ApplicationRecord
  has_many :appointments
  has_many :projects
  has_many :jobs
  has_many :members
  has_many :employers, through: :members
  has_many :passive_report, class_name: Report.name, as: :reported
  has_many :passive_follow, class_name: Relationship.name, as: :followed

  mount_uploader :banner, ImageUploader
  mount_uploader :logo, LogoUploader

  validates :name, presence: true
  VALID_PHONE_REGEX = /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/i
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}, uniqueness: {case_sensitive: false}
end
