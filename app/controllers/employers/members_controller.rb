class Employers::MembersController < Employers::EmployersController
  before_action :current_ability
  before_action :load_company
  before_action :get_values_checked, only: :index
  load_resource

  def index
    @members = @company.members.page(params[:page]).per Settings.apply.page
    @users = User.not_role(User.roles[:admin]).not_member.search_name_or_mail(params[:search])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user_ids = params[:member][:user_ids]
    members = []
    user_ids.each do |i|
      next if i.blank?
      members << Member.new(position: "employee", start_time: Date.current,
        company_id: params[:company_id], user_id: i)
    end
    if Member.import members
      flash[:success] = t "add_member_complete"
    else
      flash[:danger] = t "can_not_add_member"
    end
    redirect_to employers_company_members_path
  end

  def update
    respond_to do |format|
      if @member.update_attributes member_params
        format.js{@message = t "update_success"}
      else
        format.js{@message = t "update_error"}
      end
    end
  end

  private

  def get_values_checked
    @member_checkeds = if params[:checked_values].present?
      params[:checked_values].strip.split(',')
    else
      []
    end
  end

  def member_params
    params.require(:member).permit :position, :start_time, :end_time
  end
end
