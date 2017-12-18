require "rails_helper"

RSpec.describe Employers::CompaniesController, type: :controller do
  let(:job) {FactoryGirl.create :job}
  subject {job}
  before { sign_in User.first }

  describe "DELETE #destroy" do
    it "destroy job" do
      delete :destroy, params: {id: subject.id}
      expect(flash[:success]).to match(I18n.t "employers.apply.destroysuc")
    end
  end
end
