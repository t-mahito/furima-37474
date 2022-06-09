class OrdersController < ApplicationController

  def index
    @ShoppingForm = ShoppingForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @ShoppingForm = ShoppingForm.new(shopping_form_params)
     
    if @ShoppingForm.valid?
      @ShoppingForm.save
      redirect_to root_path
     else
      render "orders/index"
    end

  end

  private
   def shopping_form_params
    params.require(:shopping_form).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
   end

end
