module JobsHelper
  def display_company_banner company
    image_tag(company.banner.url) if company.banner.url.present?
  end
end
