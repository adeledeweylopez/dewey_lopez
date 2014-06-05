class CommentsController < ApplicationController
	
	def create
		@page = Page.find_by(id: params[:comment][:page_id])
		@comment = @page.comments.build(comment_params)
	    if @comment.save
	      flash[:success] = "Comment posted!"
	    else
	      #flash[:error] = "Invalid comment"
	    end
	    redirect_to page_url(@page)
	end

	def show
		@comment = Comment.find_by(id: params[:id])
	end

	def destroy
	end

	private

	    def comment_params
	      params.require(:comment).permit(:name, :content, :page_id, :email, :level, :parent_id)
	    end
end