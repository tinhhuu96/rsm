require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it {is_expected.to have_many :achievements}
    it {is_expected.to have_many :clubs}
    it {is_expected.to have_many :certificates}
    it {is_expected.to have_many :experiences}
    it {is_expected.to have_many :friends}
    it {is_expected.to have_many :microposts}
    it {is_expected.to have_many :active_follow}
    it {is_expected.to have_many :passive_follow}
    it {is_expected.to have_many :active_report}
    it {is_expected.to have_many :passive_report}
    it {is_expected.to have_many :jobs}
    it {is_expected.to have_many :bookmark_likes}
    it {is_expected.to have_many :feedbacks}
    it {is_expected.to have_many :applys}
    it {is_expected.to have_many :appointments}
    it {is_expected.to have_many :notifications}
    it {is_expected.to have_many :members}
  end

  context "column" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:birthday).of_type(:date)}
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:text)}
    it {is_expected.to have_db_column(:sex).of_type(:boolean)}
    it {is_expected.to have_db_column(:role).of_type(:integer)}
  end
end
