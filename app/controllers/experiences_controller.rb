class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_experience

  def create
    respond_to do |format|
      if @experience.save
        format.js{@message = t ".create_success"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @experience.update_attributes params_experience
        format.js{@message = t ".update_success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @experience.destroy
        format.js{@message_success = t ".destroy_success"}
      else
        format.js{@message_failed = t ".destroy_fail"}
      end
    end
  end

  private

  def params_experience
    params.require(:experience).permit :name, :company, :project_detail,
      :start_time, :end_time, :user_id
  end
end
