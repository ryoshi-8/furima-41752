class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:postcode, :prefecture_id, :city, :block, :building,
                                                 :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
