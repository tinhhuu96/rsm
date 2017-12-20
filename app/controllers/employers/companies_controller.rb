class Employers::CompaniesController < Employers::EmployersController
  load_and_authorize_resource
  before_action :current_ability
  before_action :load_company

  def update
    if @company.update_attributes company_params
      flash[:success] = t "update_completed"
      redirect_to edit_employers_company_path
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit :name, :address, :majors, :contact_person,
      :phone, :company_info, :banner, :logo,
      activities_attributes: %i(id title description picture company_id _destroy)
  end
end
