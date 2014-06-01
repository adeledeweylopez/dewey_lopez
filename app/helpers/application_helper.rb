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
		return Kramdown::Document.new(text, coderay_line_numbers: :table).to_html
 	end
end
