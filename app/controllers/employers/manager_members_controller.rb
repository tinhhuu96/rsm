class Employers::ManagerMembersController < Employers::EmployersController
  before_action :load_company only: :index

  def index
    @members = @company.members
  end

  private

  def load_company
    @company = current_user.members.last.company
  end
end
