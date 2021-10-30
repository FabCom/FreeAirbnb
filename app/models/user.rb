class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email non valid" }

  validates :phone_number,
    presence: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Numéro non valide en France" }


  has_many :administered_lodgings, foreign_key: 'administrator_id', class_name: "lodging"
  has_many :reserved_lodgings, foreign_key: 'guest_id', class_name: "lodging"
end
