module CompaniesHelper
  def show_banner img_type
    image_tag @company.banner.url, class: img_type
  end
end
