class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :private_method,only: [:show,:edit,:update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end  
  end
  def update
    if @item.user_id == current_user.id
      @item.update(item_params)
      redirect_to action: :show
    else 
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:price,:category_id,:status_id,:shipping_area_id,:shipping_cost_id,:shipping_day_id).merge(user_id: current_user.id)
  end
  def private_method
    @item = Item.find(params[:id])
  end
end
