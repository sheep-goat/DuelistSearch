module PostsHelper
  def format_date(date)
    date.strftime(t('time.formats.post'))
  end

  def deadline(schedule)
    return "expired" if expired?(schedule)
    return "recruting"
  end

  def expired?(schedule)
    now = Time.now
    return true if now >= schedule
    return false
  end
end
