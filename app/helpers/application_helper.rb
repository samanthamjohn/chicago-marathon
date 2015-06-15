module ApplicationHelper
  def pretty_date(date)
    date.strftime("%A %B %e %Y")
  end
end
