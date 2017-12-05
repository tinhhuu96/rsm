class CompaniesController < ApplicationController
  layout "employer"

  before_action :authenticate_user!
  before_action :load_company, only: %i(show edit update)
  before_action :load_jobs, only: :show

  def show; end

  def edit; end

  def update
    if @company.update_attributes company_params
      flash[:success] = t "update_success"
    else
      flash[:danger] = t "can_not_update"
    end
    redirect_to company_path
  end

  private

  def company_params
    params.require(:company).permit :name, :address, :majors, :contact_person,
      :phone, :company_info, :banner, :logo
  end

  def load_company
    @company = Company.find_by id: params[:id]
    return if @company
    flash[:danger] = t "can_not_find_company"
    redirect_to root_url
  end

  def load_jobs
    @job = current_user.jobs.build if user_signed_in?
    @jobs = @company.jobs.sort_lastest.page(params[:page]).per(Settings.pagination.jobs_perpage)
  end
end
