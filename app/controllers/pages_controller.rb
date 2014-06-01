class PagesController < ApplicationController
  	before_action :signed_in_user, 	only: [:create, :destroy]
	before_action :correct_user, 	only: [:edit, :destroy]

	def new
  		@page= Page.new
 	end

  	def create
    	@page = current_user.pages.build(page_params)
    	if @page.save
      		flash[:success] = "Post created!"
      		redirect_to user_url(current_user)
    	else
      		render 'show'
    	end
  	end

   def destroy
    @page.destroy
    redirect_to user_url(current_user)
  end

  def show
  	@page = current_user.pages.find_by(id: params[:id])
  end

  def edit
  	@page = current_user.pages.find_by(id: params[:id])
  end

  def update
  	@page = current_user.pages.find_by(id: params[:id])
		if @page.update_attributes(page_params)
			flash[:success] = "Post updated"
			redirect_to @page 
		else
			render 'edit'
		end
	end


  private

    def page_params
      params.require(:page).permit(:title, :content)
    end

    def correct_user
      @page = current_user.pages.find_by(id: params[:id])
      redirect_to user_url(current_user) if @page.nil?
    end
end
