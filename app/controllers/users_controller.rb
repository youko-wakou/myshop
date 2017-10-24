class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show]
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @image = Image.find_by(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。ログインしてください'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end
  
  def list
    @user = User.all.order('created_at DESC').page(params[:page]).per(10)
  end
    
    private
    
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
end
