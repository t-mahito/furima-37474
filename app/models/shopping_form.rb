class ShoppingForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id, :token

   validates :postal_code, presence: true
   validates :area_id,     numericality: {other_than: 1 , message: "can't be blank"}
   validates :city,        presence: true
   validates :address,     presence: true
   validates :phone_number,presence: true, numericality: {only_integer: true}, length: {minimum: 10, maximum: 11}
   validates :token,       presence: true

   with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/} do
    validates :postal_code
   end


   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id, area_id: area_id)
   end

end