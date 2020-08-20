class Rafle < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :tickets
  has_many :participants, class_name: "User", through: :tickets

  def as_json option={}
    {
      id: id,
      name: name,
      date_time: date_time,
      description: description,
      numbers_quantity: numbers_quantity,
      premium: premium,
      winner_number: winner_number,
      image_url: image_url,
      owner: owner.name,
      price: price,
      total_tickets: tickets.size,
      tickets_reserved: tickets.where(status: 0).size,
      tickets_paids: tickets.where(status: 1).size
    }
  end
end
