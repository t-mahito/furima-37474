class ShoppingForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id, :token

   validates :postal_code, presence: true 
   validates :area_id,     numericality: {other_than: 1 , message: "can't be blank"}
   validates :city,        presence: true
   validates :address,     presence: true
   validates :phone_number,presence: true
   validates :token,       presence: true
   validates :user_id,     presence: true
   validates :item_id,     presence: true

   with_options format: {with: /\A[0-9]{3}-[0-9]{4}\z/} do
    validates :postal_code
   end

   with_options format: {with: /\A[0-9]{10,11}\z/} do
    validates :phone_number
   end



   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id, area_id: area_id)
   end
  end