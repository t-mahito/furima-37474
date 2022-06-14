class ShoppingForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id, :token

   validates :postal_code, presence: true
   validates :area_id,     presence: true
   validates :city,        presence: true
   validates :address,     presence: true
   validates :phone_number,presence: true
   validates :token,       presence: true

   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id, area_id: area_id)
   end

end