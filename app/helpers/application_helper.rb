module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t("app")
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def check_mail vr_resource
    vr_resource.pending_reconfirmation? ? vr_resource.unconfirmed_email : vr_resource.email
  end
end
