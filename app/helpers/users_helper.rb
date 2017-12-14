module UsersHelper
  def show_avatar user
    image_tag user.picture.url, class: "avatar_users img-responsive avatar"
  end
end
