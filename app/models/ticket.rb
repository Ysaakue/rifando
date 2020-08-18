class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :rafle

  validate :valid_number

  enum status:[
    :reserved,
    :paid
  ]

  def valid_number
    if number > rafle.numbers_quantity || number <= 0
      errors.add(:number, "O número está fora dos permitidos")
    end
  end
end
