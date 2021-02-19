class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record = PurchaseRecordsDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record =  PurchaseRecordsDestination.new(purchase_records_params)
    if @purchase_record.valid?
      @purchase_record.save
      return redirect_to root_path
    else
      render :index
    end
  end
  private

  def purchase_records_params
    params.permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number,:item_id).merge(user_id: current_user.id)
  end
end
