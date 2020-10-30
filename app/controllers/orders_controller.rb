class OrdersController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end 
  
  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
 end
end
