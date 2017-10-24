class ShoppingCartsController < ApplicationController
  def index
    # binding.pry
    @shopping_cart = current_user.shopping_carts 
    @cart_item = current_user.shopping_item
    @cart = current_user.shopping_carts.build
    @id = current_user.shopping_carts
    @item = current_user.shopping_item.where(history: 1).select(:id)
    # put
    @send = current_user.shopping_item.where(history: 1).select(:id)
    @want_item = []
    @send.each do |send|
      @want_item << send.id
    end
    @price = current_user.shopping_item.where(history: 1).sum(:price)
  end
  
  def delete
    # binding.pry
    @history = params[:history]
    @delete_list = current_user.historys.find_by(id: @history)
    if @delete_list.destroy
      flash[:success] = '購入履歴を削除しました。'
      redirect_to shopping_history_url
    else
      flash[:danger] = '購入履歴の削除に失敗しました。'
      redirect_to shopping_history_url
    end

  end

  def history
    @result = current_user.historys
  end
  def list
    # binding.pry
    if current_user.shopping_carts.present?
      current_user.shopping_carts.delete_all
    else
    end
    @history_item_update = current_user.shopping_item.where(history: 1)
    @history_update = current_user.shopping_carts.where(view: 1)
    @item_id = params[:item_id]
    @price = params[:total]
    @history = current_user.historys.build(total: @price,item_id: @item_id)
    if @history_update &&  @history.save!
      @history_item_update.update(history: 0)
      flash[:success] = '商品をご購入頂きありがとうございます。'
      redirect_to shopping_history_url
    else
      flash[:danger] = '商品の購入に失敗しました。'
      redirect_to shopping_carts_url
    end
    
  end

  def create
    @item_id = params[:item_id]
    @price = 
    @cart = current_user.shopping_carts.build(item_id: @item_id)
    
    if @cart.save
      flash[:success] = 'ショッピングカートにアイテムを追加しました'
      @item_type = Item.find_by(id: @item_id).update(view: 0)
      redirect_to shopping_carts_url
    else
      flash[:danger] = 'ショッピングカートへの追加に失敗しました'
      redirect_to shopping_carts_url
    end
  end

  def destroy
    @delete_cart = current_user.shopping_carts.find_by(item_id: params[:id])
    if @delete_cart.destroy
      flash[:success] = 'カートから商品を削除しました'
      redirect_to shopping_carts_url
      @item_type = Item.find_by(id: params[:id]).update(view: 1)
    else
      flash[:danger] = 'カートから商品が削除できません'
      redirect_to shopping_carts_url
    end
  end
  
  private
   
  def history_params
     params.require(:history).permit(:total,:item_id)
  end
end
