class Branch < ApplicationRecord
  belongs_to :company
  has_many :jobs

  validates :name, presence: true
  validates :street, presence: true
  validates :province, presence: true
  validates :country, presence: true

  scope :order_province_desc, ->{order(province: :desc)}
end
