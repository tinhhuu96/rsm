require "rails_helper"

RSpec.describe RewardBenefit, type: :model do
  context "associations" do
    it {is_expected.to belong_to :job}
  end

  context "column" do
    it {is_expected.to have_db_column(:content).of_type(:text)}
    it {is_expected.to have_db_column(:job_id).of_type(:integer)}
  end
end
