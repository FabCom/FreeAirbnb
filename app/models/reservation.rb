class Reservation < ApplicationRecord
  validates :lodging, presence: true
  validates :guest, presence: true
  validates :start_date, :end_date, presence: true
# validate :start_date_cannot_be_in_the_past, on: :create
  validate :end_date_cannot_be_before_start_date
  validate :overlaping_reservation?

  belongs_to :lodging
  belongs_to :guest, class_name: "User"

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "Impossible de réserver dans le passé !")
    end
  end
  def end_date_cannot_be_before_start_date
    if end_date <= start_date
      errors.add(:start_date, "La date de fin doit être postérieure à la date de début, of course !")
    end
  end

  def overlaping_reservation?
    Reservation.where(lodging: lodging).each do |current|
      if start_date >= current.start_date && start_date <= current.end_date || end_date >= current.start_date && end_date <= current.end_date
        errors.add(:start_date, "Désolé, le logement est déjà réservé pour ces dates !")
      end
    end
  end
end
