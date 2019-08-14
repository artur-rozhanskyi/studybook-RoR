class Carriage < ApplicationRecord
  validates :bottom_places, presence: true
  validates :upper_places, presence: true
  validates :carriage_type, presence: true
  validates :train, presence: true

  belongs_to :carriage_type
  belongs_to :train
end
