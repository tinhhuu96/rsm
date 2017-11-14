require "rails_helper"

RSpec.describe Experience, type: :model do

  context "associations" do
    it {should belong_to :user}
  end

  context "columns" do
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:company).of_type(:string)}
    it {should have_db_column(:start_time).of_type(:date)}
    it {should have_db_column(:end_time).of_type(:date)}
    it {should have_db_column(:project_detail).of_type(:text)}
    it {should have_db_column(:user_id).of_type(:integer)}
  end
end
