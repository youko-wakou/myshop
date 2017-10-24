class MessagesController < ApplicationController
  def index
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(params_message)
    if @message.save
      flash[:success] = 'メッセージを送信しました'
      redirect_to @message
    else
      flash[:danger] = 'メッセージの送信に失敗しました'
    end
  end

  def show
    @message = Message.where(id: params[:id])
  end

  def destroy
  end
  def message
    @messages = current_user.messages.order('created_at DESC').page(params[:page]).per(5)
    # @user = params[:user]
  end
  
  def user_message
    # binding.pry
    @user = params[:user]
    @id = params[:id]
    @user_content = User.where(id: @user)
    @message = Message.where(id: @id)
    if Image.find_by(user_id: @user).nil? 
      @image = 'user.png'
    else
      @image = Image.find_by(user_id: @user).image.url
    end
    @user_message = User.where(id: @user)
    @message = Message.where(id: @id)
    # @image = Image.where(user_id: @user)
    
    @receives = Receive.where(message_id: @id)
    @receive_user = @receives.select(:user_id)
    @get_user = User.where(id: @receive_user)
    if Image.find_by(user_id: @receive_user).present?
      @get_image = Image.find_by(user_id: @receive_user).image.url
    else
      @get_image = 'user.png'
    end
    @receive_if = Receive.find_by(message_id: @id)
    
    
  end
  def receive
  end
  def get_message
    @messages = Message.where(select_user: current_user.id).order('created_at DESC').page(params[:page]).per(5)
  end
  private
  
  def params_message
    params.require(:message).permit(:title,:content,:select_user)
  end
end
