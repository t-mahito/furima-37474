class Charge < ActiveHash::Base
  self.data = [
    { id: , name: "---"},
    { id: , name: "着払い（購入者負担"},
    { id: , name: "送料込み（出品者負担"},
  ]

  include ActiveHash::Associations
  has_many :items

end
