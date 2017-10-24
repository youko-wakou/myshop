class ShopsController < ApplicationController
  def index
    # binding.pry
    name = params[:name]
    if params[:category].present? && params[:name].present?
      @items = Item.where(category: params[:category]).where("name like ?","%" + name + "%").order('created_at DESC').page(params[:page]).per(12)
    elsif params[:name].present?
      @items = Item.where("name like ?","%" + name + "%").order('created_at DESC').page(params[:page]).per(12)
    elsif params[:category].present?
      @items = Item.where(category: params[:category]).order('created_at DESC').page(params[:page]).per(12)
    else
      @items = Item.all.order('created_at DESC').page(params[:page]).per(12)
    end
  end

end
