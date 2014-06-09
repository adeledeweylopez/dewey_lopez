module StaticPagesHelper

  def current_admin
  	return current_user.admin unless current_user.nil?
  end
end
