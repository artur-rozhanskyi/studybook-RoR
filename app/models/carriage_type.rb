class CarriageType < ApplicationRecord
  validates :name, presence: true

  has_many :carriages, dependent: :nullify
end
