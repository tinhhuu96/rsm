require "rails_helper"

RSpec.describe ClubsController, type: :controller do
  let(:club) {FactoryGirl.create :club}
  let(:user) {FactoryGirl.create :user}
  subject {club}
  before { sign_in user }

  describe "GET #edit" do
    before :each do
      get :edit, xhr: true, params: {id: club.id}
    end
    it "assigns the requested club to @club" do
      expect(assigns(:club)).to eq club
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update club success" do
      patch :update, params: { id: club.id, club:{name: "Vux.", position: "member",
        start_time: "10/12/2017", end_time: "11/11/2017", user_id: user.id} },
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("clubs.update.update_success"))
    end
    it "update club fail" do
      patch :update, params: { id: club.id, club:{name: "", start_time: "12/11/2017"} },
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("clubs.update.update_fail"))
    end
  end

  describe "POST #create" do
    it "create club success" do
      post :create, params: {club:{name: "Vux.", position: "member",
        start_time: "10/12/2017", end_time: "11/11/2017", user_id: user.id} },
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("clubs.create.create_success"))
    end
    it "create club fail" do
      post :update, params: { id: club.id, club:{name: "", start_time: "12/11/2017"} },
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("clubs.create.create_fail"))
    end
  end

  describe "DELETE #destroy" do
    it "destroy club success" do
      delete :destroy, params: {id: club.id}, xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("clubs.destroy.destroy_success"))
    end
  end
end
