require "rails_helper"

RSpec.describe AchievementsController, type: :controller do
  let(:achievement) {FactoryGirl.create :achievement}
  let(:user) {FactoryGirl.create :user}
  subject {achievement}
  before {sign_in user}

  describe "GET #new" do
    before :each do
      get :new, xhr: true
    end
    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    it "create achievement success" do
      post :create, params: {achievement: {name: "phamd1ucpho", majors: "CNTT",
        organization: "Da Nang city", received_time: "01/02/2017", user_id: user.id}},
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("achievements.create"))
    end
    it "create achievement fail" do
      post :create, params: {id: subject.id, achievement:{name: "", majors: "CNTT"}},
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("achievements.error"))
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, xhr: true, params: {id: subject.id}
    end
    it "assigns the requested achievement to @achievement" do
      expect(assigns(:achievement)).to eq achievement
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update achievement success" do
      patch :update, params: {id: subject.id, achievement: {name: "phamd1ucpho", majors: "CNTT",
        organization: "Da Nang city", user_id: user.id}},
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t "achievements.update_success")
    end
    it "update achievement fail" do
      patch :update, params: {id: subject.id, achievement: {name: "phamd1ucpho",received_time: "12/24/2017",
        user_id: 20}},
          xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t "achievements.can_not_update")
    end
  end

  describe "DELETE #destroy" do
    it "destroy achievement" do
      delete :destroy, params: {id: subject.id}, xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t "achievements.destroy_success")
    end
  end
end
