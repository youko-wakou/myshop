class ImagesController < ApplicationController
  def create
    if Image.find_by(user_id: current_user.id).blank?
       @image = current_user.images.build(image_params)
        if @image.save!
          flash[:success] = '画像を保存しました'
          redirect_to mypages_url
        else
          flash[:error] = '画像を保存できませんでした'
        end
    else
      flash[:success] = '画像をアップロードしました'
     @image = current_user.images.update(image_params)
     redirect_to mypages_url
    end
  end

  def new
  end
  def show
    
    @img_user = Image.find_by(user_id: current_user.id).image.url
  end
 
  
  private
  def image_params
    params.require(:image).permit(:image) 
    # parmas.require(:image).permit(:image, :user_id)
  end
  
end
