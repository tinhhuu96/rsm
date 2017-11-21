class Company < ApplicationRecord
  has_many :appointments
  has_many :projects
  has_many :jobs
  has_many :members
  has_many :passive_report, class_name: Report.name, as: :reported
  has_many :passive_follow, class_name: Relationship.name, as: :followed
end
