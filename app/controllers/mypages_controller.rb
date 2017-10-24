class MypagesController < ApplicationController
  def index
    # binding.pry
    if Image.find_by(user_id: current_user.id).present?
      @png = Image.find_by(user_id: current_user.id).image.url
    else
      @png = 'user.png'
    end
    @image = current_user.images.build
    
    @profile = current_user.profiles.build
    @profile_info = current_user.profile
  end
end
