require "rails_helper"

RSpec.describe CertificatesController, type: :controller do
  let(:certificate) {FactoryGirl.create :certificate}
  subject {certificate}

  describe "GET #edit" do
    before :each do
      get :edit, xhr: true, params: {id: certificate.id}
    end
    it "assigns the requested certificate to @certificate" do
      expect(assigns(:certificate)).to eq certificate
    end
    it "renders the #edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    it "update certificate success" do
      patch :update, params: { id: certificate.id, certificate:{name: "Lyly", majors: "IT",
        organization: "123 Da Nang", classification: "Bad", received_time: "5/9/2017", user_id: User.first.id} },
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t "certificate.success")
    end
    it "update certificate fail" do
      patch :update, params: { id: certificate.id, certificate:{name: "", received_time: "5/9/2017"} },
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t "certificate.fail")
    end
  end

  describe "POST #create" do
    it "create certificate success" do
      post :create, params: {certificate:{name: "Minh", majors: "Bank",
        organization: "1231 Da Nang", classification: "Bad", received_time: "5/9/2017", user_id: User.first.id} },
          xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t "certificate.success")
    end
    it "create certificate fail" do
      post :update, params: { id: certificate.id, certificate:{name: "", received_time: "12/11/2017"} },
        xhr: true, format: "js"
      expect(flash[:danger]).to match(I18n.t "certificate.fail")
    end
  end

  describe "DELETE #destroy" do
    it "destroy certificate success" do
      delete :destroy, params: {id: certificate.id}, xhr: true, format: "js"
      expect(flash[:success]).to match(I18n.t "certificate.success")
    end
  end
end
