class Project < ApplicationRecord
  belongs_to :company
  has_many :project_members
end
