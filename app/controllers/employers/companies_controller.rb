class Employers::CompaniesController < Employers::EmployersController
  load_and_authorize_resource
  before_action :current_ability
  before_action :get_company

  def index; end
end
