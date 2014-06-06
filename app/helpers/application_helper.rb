module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Dewey-Lopez"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def kramdown(text)
    # Format text using kramdown, a super-set of
    # markdown. We pass some parameters to make 
    # formatting CodeRay easier.
    return Kramdown::Document.new(text, 
      coderay_line_numbers: :table, 
      coderay_css: :class).to_html
  end
end
