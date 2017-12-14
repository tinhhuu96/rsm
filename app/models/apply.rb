class Apply < ApplicationRecord
  belongs_to :job
  has_one :company, through: :job
  enum status: {waitting: 0, reviewing: 1, approve: 2, rejected: 3, hired: 4}
  serialize :information, Hash
  validates :cv, presence: true
  validates :information, presence: true
  enum status: {Not_receive: 0, Received: 1}
  scope :newest_apply, ->{order :created_at}
  mount_uploader :cv, CvUploader

  validates_hash_keys :information do
    validates :name, presence: true
    validates :email, presence: true
    validates :phone, presence: true
    validates :introducing, presence: true
  end

  def of_user? user
    false if user.blank?
    user.id == self.user_id
  end
end
