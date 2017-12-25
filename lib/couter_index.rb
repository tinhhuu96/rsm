class CouterIndex
  class << self
    def couter page
      if page == "" or page.blank?
        return 1
      else
        return (page.to_i - 1) * 10 + 1
      end
    end
  end
end
