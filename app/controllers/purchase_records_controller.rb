class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseRecordsDestination.new
    
    if @purchase_record.save[:item_id]
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: @purchase_record.token,    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
