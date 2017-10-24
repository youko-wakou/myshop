class FavoritesController < ApplicationController
  def index
     @favorite = current_user.user_favorite.order(created_at: :desc).page(params[:page]).per(10)
    
  end

  def create
   
    # binding.pry
    @item = params[:item_id]
    current_user.favorites.find_or_create_by(item_id: @item)
    flash[:success] = '商品をお気に入りに登録しました'
    redirect_to item_url(id: @item)
  end

  def destroy
    
    @item = params[:item_id]
    favorite_item = current_user.favorites.where(item_id: @item)
    favorite_item.destroy_all
    flash[:danger] = '商品のお気に入りを解除しました'
    redirect_to favorites_url
  end
  
 def show 
   binding.pry
    @item = params[:item_id]
    current_user.favorites.find_or_create_by(item_id: @item)
    flash[:success] = '商品をお気に入りに登録しました'
    redirect_to item_url(id: @item)
 end
  def ranking
    # binding.pry
    @ranking = Favorite.group(:item_id).order('count_item_id DESC').count(:item_id) 
    @items = []
    @counts = []
    @ranking.each do |a,b|
      @items << a 
      @counts << b
    end
    @rank = []
    @items.each do |item|
      @goods = Item.find(item)
      if @goods.view == 1
        @rank << @goods
      end
    end
    @rank.first(10)
    @num = [*1..10]
  end
end
