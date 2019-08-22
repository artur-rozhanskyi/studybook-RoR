class CoupeCarriage < Carriage
  validates :bottom_places, :upper_places, presence: true
end
