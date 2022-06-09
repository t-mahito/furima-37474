class ItemsController < ApplicationController

  before_action :authenticate_user! , only: [:new, :create, :edit, :destroy] 
  before_action :find_item, only: [:show, :edit, :update, :destroy]

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
    unless @item.user.id == current_user.id
     redirect_to action: :index
    end

  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end

  end

  def destroy
    if current_user.id == @item.user.id
     @item.destroy
    end
     redirect_to action: :index
  end



  private
   def item_params
    params.require(:item).permit(:name,:text,:category_id,:condition_id,:charge_id,:area_id,:delivery_id,:price,:image).merge(user_id: current_user.id)
   end

   def find_item
    @item = Item.find(params[:id])
   end
end
