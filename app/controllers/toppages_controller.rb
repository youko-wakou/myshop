class ToppagesController < ApplicationController
   
  def index
    #render :layout =>false
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
    @top = @rank.first(4)
    @five_num = [*1..4]
    @a = 'aaaaaaa'
    
    @create = Item.all.order('created_at DESC').limit(6)
    render :layout =>false
  end
end
