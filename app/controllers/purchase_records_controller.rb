class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index,:create]
  before_action :find,only: [:index,:create]
  def index
    @purchase_record = PurchaseRecordsDestination.new
    if current_user == @item.user || @item.purchase_record.presence
      redirect_to root_path
    end
  end

  def create
    @purchase_record =  PurchaseRecordsDestination.new(purchase_records_params)
    if @purchase_record.valid?
      pay_item
      @purchase_record.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def purchase_records_params
    params.permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number,:item_id,:token).merge(user_id: current_user.id,token: params[:token])
  end

  def find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: @purchase_record.token,    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
