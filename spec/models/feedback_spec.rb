require "rails_helper"

RSpec.describe Feedback, type: :model do

  context "associations" do
    it {should belong_to :user}
    it {should belong_to :job}
  end

  context "columns" do
    it {should have_db_column(:content).of_type(:text)}
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:job_id).of_type(:integer)}
  end
end
