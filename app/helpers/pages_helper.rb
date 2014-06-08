module PagesHelper
  def find_page
    Page.find_by(id: params[:page_id]) || Page.find_by(id: params[:id]) || Page.find_by(page_alias: params[:page_alias])
  end

  def page_path_helper(page)
  	post_url(user_alias: User.find(page.user_id).user_alias, page_alias: page.page_alias)
  end
end
