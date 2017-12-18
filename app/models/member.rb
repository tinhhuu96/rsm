class Member < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :project_members, dependent: :destroy
end
