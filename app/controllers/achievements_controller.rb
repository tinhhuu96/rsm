class AchievementsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :params_achievements

  def new
    @achievement = current_user.achievements.new
  end

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

  private

  def params_achievements
    achievement = params.require(:achievement).permit :name, :majors, :organization, :received_time, :user_id
    if achievement[:received_time].present?
      achievement[:received_time] = ConvertDate.format_date(achievement[:received_time])
    end
    achievement
  end
end
