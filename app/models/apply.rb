class Apply < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_one :company, through: :job
  enum status: {waitting: 0, reviewing: 1, approve: 2, rejected: 3, hired: 4}
  scope :newest_apply, ->{order :created_at}
end
