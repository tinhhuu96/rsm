class Employers::CompaniesController < Employers::EmployersController
  before_action :load_branch_id_owner_jobs, only: [:index, :edit, :show]

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
      activities_attributes: %i(id title description picture company_id _destroy),
      partners_attributes: %i(id name email description picture company_id _destroy),
      branches_attributes: %i(id status is_head_office name phone street ward district province country company_id _destroy)
  end

  def load_branch_id_owner_jobs
    @branch_id_owner_jobs = @company.jobs.pluck :branch_id
  end
end
