class AchievementsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_achievements

  def create
    respond_to do |format|
      if @achievement.save
        format.js{@message = t "achievements.create"}
      else
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @achievement.update_attributes params_achievements
        format.js{@message = t "achievements.update_success"}
      else
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @achievement.destroy
        format.js{@message_success = t "achievements.destroy_success"}
      else
        format.js{@message_failed = t "achievements.destroy_fail"}
      end
    end
  end

  private

  def params_achievements
    params.require(:achievement).permit :name, :majors, :organization, :received_time, :user_id
  end
end
