class CompaniesController < ApplicationController
  layout "employer"
  before_action :load_company, only: %i(show edit)

  def load_company
    @company = Company.find_by id: params[:id]
    return if @company
    flash[:danger] = t "can_not_find_company"
    redirect_to root_url
  end

  def show; end

  def edit
  end
end
