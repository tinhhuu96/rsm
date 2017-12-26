class JobsController < ApplicationController
  layout "jobs/job"

  before_action :authenticate_user!, except: %i(index show)
  before_action :load_company
  before_action :load_job, except: %i(index new create)
  before_action :load_employer, only: :show
  before_action :load_jobs, only: :show
  before_action :create_bookmark, only: :show
  before_action :create_like, only: :show
  before_action :load_reward_benefits, only: :show
  before_action :build_apply, only: :show
  before_action :create_job, only: :index, if: :user_signed_in?
  before_action :create_reward_benefits,
    only: :index, if: :user_signed_in?

  before_action :load_branches_for_select_box, only: :index
  before_action :load_category_for_select_box, only: :index


  def index
    @q = @company.jobs.ransack params[:q]
    @jobs = @q.result(distinct: true).sort_lastest
      .page(params[:page]).per(Settings.pagination.jobs_perpage)
  end

  def show
    if user_signed_in?
      @applied = @job.applies.find_by user_id: current_user.id
      @bookmarked = @job.bookmark_likes.find_by user_id: current_user.id,
        bookmark: BookmarkLike.bookmarks.keys[Settings.bookmark.bookmarked]
      @liked = @job.bookmark_likes.find_by user_id: current_user.id,
        bookmark: BookmarkLike.bookmarks.keys[Settings.bookmark.liked]
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build job_params
    respond_to do |format|
      if @job.save
        format.js{ @message = t ".job_created"}
      else
        format.js
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @job.update_attributes job_params
        format.js{@message = t ".job_updated"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @job.destroy
        format.js{flash.now[:success] = t ".job_destroyed"}
      else
        format.js{flash.now[:danger] = t ".job_cant_destroy"}
      end
    end
  end

  private

  def job_params
    params.require(:job).permit :content, :name, :level, :language,
      :skill, :position, :company_id, :description, :min_salary, :max_salary,
      reward_benefits_attributes: %i(id content job_id _destroy)
  end

  def load_job
    @job = Job.includes(:bookmark_likes).find_by id: params[:id]
    return if @job
    flash.now[:danger] = t "jobs.method.cant_find_job"
    redirect_to root_url
  end

  def load_jobs
    @jobs = @company.jobs.sort_lastest.page(params[:page]).per(Settings.pagination.jobs_perpage)
  end

  def create_bookmark
    return unless user_signed_in?
    @bookmark = current_user.bookmark_likes.build
    @bookmark.job_id = @job.id
    @bookmark.bookmark = BookmarkLike.bookmarks.keys[Settings.bookmark.bookmarked]
  end

  def create_like
    return unless user_signed_in?
    @like = current_user.bookmark_likes.build
    @like.job_id = @job.id
    @like.bookmark = BookmarkLike.bookmarks.keys[Settings.bookmark.liked]
  end

  def build_apply
    @apply = Apply.new job_id: @job.id
    @apply.user_id = current_user.id if user_signed_in?
  end

  def load_employer
    @employer = @job.user
    return if @employer
    flash.now[:danger] = t "jobs.method.cant_find_employer"
  end

  def load_reward_benefits
    @reward_benefits = @job.reward_benefits
  end

  def create_job
    @job = @company.jobs.new user_id: current_user.id
  end

  def create_reward_benefits
    @job.reward_benefits.build
  end

  def load_branches_for_select_box
    @provinces ||= @company.branches.order_province_desc.pluck :province, :id
  end

  def load_category_for_select_box
    @categories ||= @company.categories.order_name_desc.pluck :name, :id
  end
end
