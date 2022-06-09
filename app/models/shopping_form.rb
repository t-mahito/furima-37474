class ShoppingForm
  include ActiveModel::model

  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :address, :building_name, :phone_number, :order_id 

   validates :postal_code, presence: true
   validates :area_id,     numericality: { other_than: 1}
   validates :city,        presence: true
   validates :address,     presence: true
   validates :phone_number,presence: true

   def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
   end

end