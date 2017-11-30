controller spec:
require "rails_helper"

RSpec.describe jobsController, type: :controller do
  let(:job) {FactoryGirl.create :job}
  subject {job}
  before { sign_in User.first }
end
