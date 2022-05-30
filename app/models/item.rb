class Item < ApplicationRecord

validates :name,         presence: true
validates :text,         presence: true
validates :category_id,  presence: true
validates :condition_id, presence: true
validates :charge_id,    presence: true
validates :area_id,      presence: true
validates :deliverly_id, presence: true
validates :price,        presence: true
validates :image,        presence: true

belongs_to :user
has_one_attached :image
end
