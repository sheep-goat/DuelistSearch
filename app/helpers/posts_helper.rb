module PostsHelper
  def format_date(date)
    date.strftime(t('time.formats.post'))
  end
end
