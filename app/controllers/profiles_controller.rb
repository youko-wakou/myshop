class ProfilesController < ApplicationController
  def create
    # binding.pry
    
    if Profile.find_by(user_id: current_user.id).blank?
      @profile = current_user.profiles.build(profile_params)
      if @profile.save
        flash[:success] = 'プロフィールの内容を投稿しました'
        redirect_to mypages_url
      else
        flash[:danger] = 'プロフィールの更新に失敗しました'
      end
    else
      
       @profile = current_user.profiles.update(profile_params)
      flash[:success] = 'プロフィールを更新しました'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:place,:hp,:twitter,:pr)
  end
  
end
