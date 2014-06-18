module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end
  
  # #Use application helper
  # def display_datetime(dt)
  #   dt.to_formatted_s(:long_ordinal)
  

end
