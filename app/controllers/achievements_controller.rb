class AchievementsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_achievements

  def create
    @achievement = current_user.achievements.new params_achievements
    respond_to do |format|
      if @achievement.save
        format.js{flash[:success] = t "achievements.create"}
      else
        format.js{flash[:danger] = t "achievements.error"}
      end
    end
  end

  def update
    respond_to do |format|
      if @achievement.update_attributes params_achievements
        format.js{flash[:success] = t "achievements.update_success"}
      else
        format.js{flash[:danger] = t "achievements.can_not_update"}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @achievement.destroy
        format.js{flash[:success] = t "achievements.destroy_success"}
      else
        format.js{flash[:danger] = t "achievements.destroy_fail"}
      end
    end
  end

  private

  def params_achievements
    params.require(:achievement).permit :name, :majors, :organization, :received_time, :user_id
  end
end
