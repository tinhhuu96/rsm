class CompaniesController < ApplicationController
  layout "employer"
  before_action :load_company, only: %i(show edit update)
  before_action :load_current_user, only: %i(edit show)

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
    params.require(:company).permit :name, :address, :majors, :contact_person, :phone, :company_info
  end

  def load_current_user
    @user = current_user
  end
  def load_company
    @company = Company.find_by id: params[:id]
    return if @company
    flash[:danger] = t "can_not_find_company"
    redirect_to root_url
  end
end
