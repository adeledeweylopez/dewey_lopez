module PagesHelper
  def find_page
	Page.find_by(id: params[:page_id]) || Page.find_by(id: params[:id]) || Page.find_by(page_alias: params[:page_alias])
  end
end