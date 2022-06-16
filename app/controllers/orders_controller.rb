class OrdersController < ApplicationController

  before_action :authenticate_user! , only: [:index]
  before_action :find_item, only: [:index, :create]

  def index
    @ShoppingForm = ShoppingForm.new

    if @item.order.present? || @item.user.id == current_user.id
      redirect_to root_path
    end

  end

  def create
    @ShoppingForm = ShoppingForm.new(shopping_form_params)
     
    if @ShoppingForm.valid?
      pay_item
      @ShoppingForm.save
      redirect_to root_path
     else
      render "orders/index"
    end

  end

  private
   def shopping_form_params
    params.require(:shopping_form).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

   def find_item
    @item = Item.find(params[:item_id])
   end

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: shopping_form_params[:token],
        currency: "jpy"
      )
    end

end
