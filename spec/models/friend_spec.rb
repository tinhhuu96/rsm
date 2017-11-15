require "rails_helper"

RSpec.describe Friend, type: :model do

  context "associations" do
    it {should belong_to :user}
  end

  context "columns" do
    it {should have_db_column(:status).of_type(:boolean)}
    it {should have_db_column(:friend_id).of_type(:integer)}
    it {should have_db_column(:friend_id).of_type(:integer)}
  end
end
