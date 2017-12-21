class Branch < ApplicationRecord
  belongs_to :company
  has_many :jobs

  scope :order_province_desc, ->{order(province: :desc)}
end
