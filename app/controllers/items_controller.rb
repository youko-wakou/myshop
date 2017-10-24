class ItemsController < ApplicationController
  def create
    # binding.pry
    # @item.type = 0
    @item = current_user.items.build(item_params)
    if @item.save!
      flash[:success] = '商品を出品しました'
      redirect_to items_url
    else
      flash[:danger] = '商品の出品に失敗しました'
      redirect_to items_url
    end
    
   
  end

  def destroy
    
  end

  def index
    # @item_id = item_id
    # @item = Item.where(id: @item_id).first
    # binding.pry
    @item = current_user.items.build
  # @user_item = current_user.items.last
  # @item_img = @user_item.image.url
    @goods = Item.where(user_id: current_user.id).order(id: :desc).limit(1)

  end

  def show
   @items = Item.where(id: params[:id])
   @item = Item.find(params[:id])
   @users = User.where(id: @item.user_id)
   @user_id = @item.user_id
    if Image.find_by(user_id: @user_id).present?
      @image = Image.find_by(user_id: @item.user_id).image.url
    else
      @image = 'user.png'
    end

  end
  
  private
  
  def item_params
    params.require(:item).permit(:name,:category,:price,:image,:content,:view,:history)
  end
end
