class OrdersController < ApplicationController

  def index
    @ShoppingForm = ShoppingForm.new
  end
  
end
