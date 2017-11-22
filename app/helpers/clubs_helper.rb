module ClubsHelper
  def show_endtime club
    if club.current?
      t "clubs.helpers.present"
    else
      club.end_time
    end
  end
  def define_cancel_club_id club
    if club.id?
      "cancel_club_edit"
    else
      "cancel_club_new"
    end
  end
end
