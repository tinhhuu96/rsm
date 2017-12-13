class Employers::JobsController < Employers::EmployersController
  load_resource
  before_action :current_ability

  def show
    @applies = @job.applies.page(params[:page]).per Settings.apply.page
  end

  def index
    @jobs = @company.jobs.page(params[:page]).per Settings.job.page
  end

  def destroy
    if @job.destroy
      flash[:success] = t "employers.apply.destroysuc"
    else
      flash[:warning] = t "error"
    end
    redirect_to employers_jobs_path
  end
end
