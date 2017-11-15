require "rails_helper"

RSpec.describe Club, type: :model do

  context "associations" do
    it {should belong_to :user}
  end

  context "columns" do
    it {should have_db_column(:name).of_type(:string)}
    it {should have_db_column(:user_id).of_type(:integer)}
  end
end
