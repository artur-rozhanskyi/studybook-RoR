class EconomyCarriage < Carriage
  validates :bottom_places, :upper_places, :side_bottom_places, :side_upper_places, presence: true  
end