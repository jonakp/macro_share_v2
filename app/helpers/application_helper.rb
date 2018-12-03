module ApplicationHelper
  def link_to_usershow_date(user, date)
    "/users/#{user.id}/on/#{date.year}/#{date.month}/#{date.day}"
  end
end
