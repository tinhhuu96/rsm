require "rails_helper"

RSpec.describe BookmarkLikesController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  let(:job) {FactoryGirl.create :job}

  before {sign_in user}

  describe "POST #create" do
    it "create bookmark_like success" do
      post :create, params: {bookmark_like: {bookmark: 0, user_id: user.id, job_id: job.id}},
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("bookmark_like.create"))
    end
    it "create bookmark_like fail" do
      post :create, params: {bookmark_like:{bookmark: "fail", user_id: 100}},
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("bookmark_like.cannot_save"))
    end
  end
end
