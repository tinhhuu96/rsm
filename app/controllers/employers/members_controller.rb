class Employers::MembersController < Employers::EmployersController
  before_action :current_ability
  load_and_authorize_resource

  def index
    @members = @company.members.page(params[:page]).per Settings.apply.page
    @users = User.not_role(User.roles[:admin]).not_member.search params[:search]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create; end

  def update
    respond_to do |format|
      if @member.update_attributes member_params
        format.js{@message = t "update_success"}
      else
        format.js
      end
    end
  end

  private

  def member_params
    params.require(:member).permit :position, :start_time, :end_time
  end
end
