require "rails_helper"
RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  subject {user}
  before {sign_in user}

  describe "GET #show" do
    before :each do
      get :show, xhr: true, params: {id: subject.id}
    end
    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
    it "renders the #show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before :each do
      get :edit, xhr: true, params: {id: subject.id}
    end
    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update achievement success" do
      @file = fixture_file_upload('123.jpg', 'image/jpg')
      patch :update, params: {id: subject.id, user: {name: "pho", picture: @file}},
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t("users.new.update_success"))
    end
    it "update achievement fail" do
      patch :update, params: {id: subject.id, user: {name: "", email: "pho@@gmail.com",
        birthday: "12/24/2017"}},
          xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t("users.new.update_fail"))
    end
  end
end
