class SupportsController < ApplicationController
  
  def index
   @support = current_user.supports.build
   @user = current_user.id
   @new = Support.where(user_id: @user).order('created_at DESC').limit(1)

  end
  def show
    
  end
  
  def create
    @support = current_user.supports.build(support_params)
    if @support.save
        flash[:success] = 'サポートへメッセージを送信しました'
        redirect_to supports_url
        
    else
        flash[:danger] = 'サポートへのメッセージの送信に失敗しました'
    end
  end
  
  private
  
  def support_params
    params.require(:support).permit(:content,:title)
  end
end
