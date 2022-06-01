class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition



validates :name,         presence: true
validates :text,         presence: true
validates :category_id,  numericality: {other_than: 1 , message: "can't be blank"}
validates :condition_id, numericality: {other_than: 1 , message: "can't be blank"}
validates :charge_id,    presence: true
validates :area_id,      presence: true
validates :deliverly_id, presence: true
validates :price,        presence: true
validates :image,        presence: true

belongs_to :user
has_one_attached :image
end
