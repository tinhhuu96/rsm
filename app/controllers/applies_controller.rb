class AppliesController < ApplicationController

  def index
    @applies = current_user.applies.includes(:job, :company).newest_apply.
      page(params[:page]).per(Settings.apply.page)
  end

  def show; end

  def create
    @apply = Apply.new apply_params
    @apply.cv = current_user.cv if params[:checkcv].blank? && user_signed_in?
    @apply.information = params[:apply][:information].permit!.to_h
    respond_to do |format|
      if @apply.save
        format.js{flash.now[:success] = t "apply.applied"}
      else
        format.js
      end
    end
  end

  private

  def apply_params
    params.require(:apply).permit :status, :user_id, :job_id, :information, :cv
  end
end
