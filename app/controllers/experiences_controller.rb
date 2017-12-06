class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_experience

  def create
    respond_to do |format|
      @experience = current_user.experiences.new params_experience
      if @experience.save
        format.js{flash[:success] = t ".create_success"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update_attributes params_experience
        format.js{flash[:success] = t ".update_success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @experience.destroy
        format.js{flash[:success] = t ".destroy_success"}
      else
        format.js{flash[:danger] = t ".destroy_fail"}
      end
    end
  end

  private

  def params_experience
    params.require(:experience).permit :name, :company, :project_detail,
      :start_time, :end_time, :user_id
  end
end
