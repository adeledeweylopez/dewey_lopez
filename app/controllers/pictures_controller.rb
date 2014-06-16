class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
  	@picture = Picture.create( picture_params )
    if @picture.save
      flash[:success] = "Uploaded!"
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end

  def show
    @picture = Picture.find_by(id: params[:id])
  end

  private

    def picture_params
      params.require(:picture).permit(:photo, :id)
    end
end
