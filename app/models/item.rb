class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :area
  belongs_to :deliverly


validates :name,         presence: true
validates :text,         presence: true
validates :category_id,  numericality: {other_than: 1 , message: "can't be blank"}
validates :condition_id, numericality: {other_than: 1 , message: "can't be blank"}
validates :charge_id,    numericality: {other_than: 1 , message: "can't be blank"}
validates :area_id,      numericality: {other_than: 1 , message: "can't be blank"}
validates :deliverly_id, numericality: {other_than: 1 , message: "can't be blank"}
validates :price,        presence: true
validates :image,        presence: true

belongs_to :user
has_one_attached :image
end
