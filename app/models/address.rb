class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  validates :postal_code,  presence: true
  validates :area_id,      numericality: {other_than: 1 , message: "can't be blank"}
  validates :city,         presence: true
  validates :address,      presence: true
  validates :phone_number, presence: true

  belongs_to :order

end
