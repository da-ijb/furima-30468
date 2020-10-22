class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all
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
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :categories_id, :states_id,
    :delivery_charges_id, :shipment_sources_id, :days_to_ships_id, :price, :image).merge(user_id: current_user.id)
  end  
end
