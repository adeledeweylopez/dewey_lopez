class CommentsController < ApplicationController

  def create
  	# TODO: Fix flash messaging 
    @page = Page.find_by(id: params[:comment][:page_id])
    @comment = @page.comments.build(comment_params)
    if @comment.save
      remember_comment @comment
      flash[:success] = "Comment posted!"
    else
      #flash[:error] = "Invalid comment"
    end
    
    redirect_to page_url(@page)
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    # TODO: Fix messaging system.
    @comment = Comment.find_by(id: params[:id])
    if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
    else
    end
    @page = Page.find_by(id: @comment.page_id)
     redirect_to page_url(@page)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @page = Page.find_by(id: @comment.page_id)
    forget_comment(@comment)
    @comment.destroy
    redirect_to page_url(@page)
  end

  private

    def comment_params
      params.require(:comment).permit(:name, 
      								  :content, 
      								  :page_id, 
      								  :email, 
      								  :level, 
      								  :parent_id, 
      								  :website)
    end
end
