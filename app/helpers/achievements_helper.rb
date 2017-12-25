module AchievementsHelper
  def define_cancel_achievement_id achievement
    if achievement.id?
      Settings.achievement.cancel_edit
    else
      Settings.achievement.cancel_new
    end
  end

  def check_information user
    current_user.is_user?(user) ? t("achievements.describle") : t("placeholder.blank")
  end
end
