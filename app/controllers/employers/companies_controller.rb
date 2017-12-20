class Employers::CompaniesController < Employers::EmployersController
  load_and_authorize_resource
  before_action :current_ability
  before_action :load_company

  def index; end
end
