class CommentsController < ApplicationController

  def create
    # TODO: Fix flash messaging
    @page = Page.find_by(id: params[:comment][:page_id])
    #@comment = @page.comments.build(comment_params)
    #if @comment.save
    #  remember_comment @comment
    #   flash[:success] = "Comment posted!"
    # else
    #   @comment.errors.full_messages.each do |msg|
    #     flash[:error] = msg
    #   end
    # end

    redirect_to page_path_helper(@page)
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    # TODO: Fix messaging system.
    @comment = Comment.find_by(id: params[:id])
    if owns_comment?(@comment)
      if @comment.update_attributes(comment_params)
        flash[:success] = "Comment updated"
      else
        @comment.errors.full_messages.each do |msg|
          flash[:error] = msg
        end
      end
      #TODO: Implement scoring
      #   else
      #   end
      # else
      #   @comment.update_attributes(comment_params)
    end

    @page = Page.find_by(id: @comment.page_id)
    redirect_to page_path_helper(@page)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @page = Page.find_by(id: @comment.page_id)
    forget_comment(@comment)
    @comment.destroy
    redirect_to page_path_helper(@page)
  end

  def upvote
    @page = Page.find_by(id: @comment.page_id)
    @comment = Comment.find_by(id: params[:id])
    @comment.update_attributes(:score => (@comment.score+1))
    respond_to do |format|
      format.html { redirect_to page_path_helper(@page) }
      format.js
    end
  end

  def downvote
  end

  private

  def comment_params
    params.require(:comment).permit(:name,
                                    :content,
                                    :page_id,
                                    :email,
                                    :level,
                                    :parent_id,
                                    :website,
                                    :score)
  end
end
