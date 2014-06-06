class PagesController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: [:edit, :destroy, :update]

  def new
    @page= Page.new
  end

  def create
    # TODO: Fix flash messaging.
    @page = current_user.pages.build(page_params)
    if @page.save
      flash[:success] = "Post created!"
      redirect_to blog_url(current_user)
    else
      redirect_to blog_url(current_user)
    end
  end

  def destroy
    @page.destroy
    redirect_to user_url(current_user)
  end

  def show
    @page = Page.find_by(id: params[:id])
    @new_comment = @page.comments.build
    
    # HACK: Need to reload the @page variable,
    # otherwise there is a blank comment
    # which causes problems.
    @page = Page.find_by(id: params[:id])
    # Indentation level of comment, starts at 0.
    @indentation = 0 
    @score = 0
    @comments = @page.comments.where("parent_id = ?", 0)
  end

  def edit
    @page = Page.find_by(id: params[:id])

  end

  def update
    # TODO: Fix flash messages.
    @page = Page.find_by(id: params[:id])
    if @page.update_attributes(page_params)
      flash[:success] = "Post updated"
      redirect_to @page
    else
      render 'edit'
    end
  end


  private

  def page_params
    params.require(:page).permit(:title, :content, :sequence, :public)
  end

  def correct_user
    # TODO: Use the :admin variable to do this cleanly.
    # HACK: All users can edit the home and about pages.
    if Page.find_by(id: params[:id]).title == "Home"
      @page = Page.find_by(title: "Home")
    elsif Page.find_by(id: params[:id]).title == "About"
      @page = Page.find_by(title: "About")
    else
      @page = current_user.pages.find_by(id: params[:id])
    end

    redirect_to user_url(current_user) if @page.nil?
  end
end
