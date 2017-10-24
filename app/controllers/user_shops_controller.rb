class UserShopsController < ApplicationController
  def index
    # binding.pry
    name = params[:name]
    if params[:category].present? && params[:name].present?
      @items = current_user.items.where("name like ?", "%" + name + "%").where(category: params[:category]).page(params[:page]).per(12)

    elsif params[:category].present?
      @items = current_user.items.where(category: params[:category]).page(params[:page]).per(12)
    elsif params[:name].present?
      @items = current_user.items.where("name like ?","%" + name + "%").page(params[:page]).per(12)
    else
       @items = current_user.items.all.page(params[:page]).per(12)
    end
  end

  def create
  end

  def show
    @item_id = params[:id]
  end

  def destroy
  end
  
  private
  # def params_search
  #   params.require(:user_shop).permit(:name,:category)
  # end
end
