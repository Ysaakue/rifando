# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :my_rafles, class_name: "Rafle", foreign_key: "owner_id"
  has_many :tickets
  has_many :rafles, through: :tickets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
