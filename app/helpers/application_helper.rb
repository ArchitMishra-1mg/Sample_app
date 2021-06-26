module ApplicationHelper
  # First custom application helper method

  def full_page_title(title = '')
    base_title = "RoR Tutorials"
    if title.empty?
      base_title
    else
      title + " | " + base_title
    end
  end
end
