class MoodsController < ApplicationController

def create
    # TODO: Fix flash messaging.
    @mood = current_user.moods.build(mood_params)
    if @mood.color
      Mood.set_color(@mood.name, @mood.color)
    end
    
    if @mood.save
      redirect_to usermood_url(current_user)
    else
      redirect_to usermood_url(current_user)
    end
  end


def show
     @user = current_user
     
     Mood.init(@user.id)
end

  private

   def mood_params
    params.require(:mood).permit(:name, 
    							 :value,
    							 :user_id,
                   :notes,
                   :color)
  end
end
