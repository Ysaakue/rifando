class Rafle < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :tickets
  has_many :participants, class_name: "User", through: :tickets
end
