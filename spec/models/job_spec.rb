require "rails_helper"

RSpec.describe Job, type: :model do

  context "associations" do
    it {should belong_to :user}
    it {should belong_to :company}
    it {is_expected.to have_many :applies}
    it {is_expected.to have_many :feedbacks}
    it {is_expected.to have_many :bookmark_likes}
    it {is_expected.to have_many :reward_benefits}
  end

  context "columns" do
    it {should have_db_column(:content).of_type(:text)}
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:level).of_type(:string)}
    it {should have_db_column(:language).of_type(:string)}
    it {should have_db_column(:skill).of_type(:string)}
    it {should have_db_column(:position).of_type(:string)}
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:company_id).of_type(:integer)}
  end
end
