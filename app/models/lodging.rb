class Lodging < ApplicationRecord

  validates :available_beds, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 140,
    too_short: "%{count} characters is the minimum allowed" }
  validates :welcome_message, presence: true
  validates :has_wifi, inclusion: { in: [ true, false] }

  belongs_to :city
  belongs_to :administrator, class_name: "User"
  has_many :reservation
end
