module ApplicationHelper

  # display title of each page
  def page_title(title)
    content_for(:title) { title }
  end

end
