module CompaniesHelper
  def show_banner img_type
    image_tag @company.banner.url, class: img_type
  end

  def has_owner_job  branch_id
    @branch_id_owner_jobs.include? branch_id
  end
end
