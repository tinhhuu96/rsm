class JobsController < ApplicationController
  layout "job"

  before_action :load_job, except: %i(index new create)
  before_action :load_employer, only: :show
  before_action :load_company, only: :show
  before_action :load_jobs, only: :show

  def show; end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build job_params
    respond_to do |format|
      if @job.save
        format.js {flash.now[:success] = t ".job_created"}
      else
        format.js {flash.now[:danger] = t ".job_cant_create"}
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @job.update_attributes job_params
        format.js {flash.now[:success] = t ".job_updated"}
      else
        format.js {flash.now[:danger] = t ".job_cant_update"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @job.destroy
        format.js {flash.now[:success] = t ".job_destroyed"}
      else
        format.js {flash.now[:danger] = t ".job_cant_destroy"}
      end
    end
  end

  private

  def job_params
    params.require(:job).permit :content, :name, :level, :language,
      :skill, :position, :company_id, :description, :min_salary, :max_salary
  end

  def load_job
    @job = Job.find_by id: params[:id]
    return if @job
    flash.now[:danger] = t "jobs.method.cant_find_job"
    redirect_to root_url
  end

  def load_jobs
    @jobs = @company.jobs.sort_lastest.page(params[:page]).per(Settings.pagination.jobs_perpage)
  end

  def load_company
    @company = @job.company
    return if @company
    flash.now[:danger] = t "jobs.method.cant_find_company"
    redirect_to root_url
  end

  def load_employer
    @employer = @job.user
    return if @employer
    flash.now[:danger] = t "jobs.method.cant_find_employer"
  end
end
