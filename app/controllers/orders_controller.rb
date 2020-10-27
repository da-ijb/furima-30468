class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end 
  
  private
 def order_params
  params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number)
 end
end
