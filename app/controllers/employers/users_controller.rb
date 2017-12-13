class Employers::UsersController < Employers::EmployersController
  load_resource
  before_action :current_ability

  def show; end
end
