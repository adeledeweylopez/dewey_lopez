module UsersHelper


  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def user_blog
  	User.all.each do |user|
  		@on_blog ||= current_page?(blog_url(user.user_alias)) 
  		user.pages.all.each do |page|
  			@on_blog ||= current_page?(page_path_helper(page)) unless page.nil?
  		end
  	end
  	return @on_blog
  end
end
