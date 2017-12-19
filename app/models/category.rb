class Category < ApplicationRecord
  belongs_to :company
  has_many :jobs

  scope :order_name_desc, ->{order(name: :desc)}
end
