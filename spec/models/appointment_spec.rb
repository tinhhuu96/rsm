require "rails_helper"

RSpec.describe Appointment, type: :model do

  context "associations" do
    it {should belong_to :user}
    it {should belong_to :company}
  end
   context "columns" do
    it {should have_db_column(:address).of_type(:text)}
    it {should have_db_column(:time).of_type(:date)}
    it {should have_db_column(:user_id).of_type(:integer)}
    it {should have_db_column(:company_id).of_type(:integer)}
  end
end
