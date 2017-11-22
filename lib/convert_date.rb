class ConvertDate
  class << self
    def format_date received_time
      Date.strptime(received_time, Settings.date_format)
    end
  end
end
