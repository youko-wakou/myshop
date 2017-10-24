class ReceivesController < ApplicationController
  def index
    # binding.pry
    @message_id = params[:message]
    @message_id = @message_id.to_i
    @receive = current_user.receives.build
    
    @target = Message.where(id: @message_id)
    @user_id = @target.select(:user_id)
    @user = User.where(id: @user_id)
    if Image.find_by(user_id: @user_id).present?
      @image = Image.find_by(user_id: @user_id).image.url
    else
      @image = 'user.png'
    end
  end

  def create
    @receive = current_user.receives.build(receive_params)
    if @receive.save
      flash[:success] = 'メッセージに返信しました'
      redirect_to receife_url @receive
    else
      flash[:danger] = 'メッセージの返信に失敗しました'
    end
  end
  def list
    @receives = current_user.receives
    
  end
  
  def show
    @id = params[:id]
    @receive = Receive.where(id: @id)
  end
  private
  
  def receive_params
    params.require(:receive).permit(:title,:content,:message_id)
  end
end
