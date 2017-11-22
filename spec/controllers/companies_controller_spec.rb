require "rails_helper"

RSpec.describe CompaniesController, type: :controller do
  let (:company) {FactoryGirl.create :company}
  subject {company}

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, company:{name: "samsung"}}
        expect(flash[:success]).to match(I18n.t("update_success"))
        expect(response).to redirect_to(company_path)
      end
    end

    context "update faild" do
      it "update with name" do
        patch :update, params: {id: subject.id, company:{name: ""}}
        expect(flash[:danger]).to match(I18n.t("can_not_update"))
        expect(response).to redirect_to(company_path)
      end
    end
  end
end
