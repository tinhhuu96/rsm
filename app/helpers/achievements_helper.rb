module AchievementsHelper
  def define_cancel_achievement_id achievement
    if achievement.id?
      Settings.achievement.cancel_edit
    else
      Settings.achievement.cancel_new
    end
  end
end
