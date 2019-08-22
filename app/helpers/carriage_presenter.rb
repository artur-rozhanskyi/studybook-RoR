class CarriagePresenter < BasePresenter
  def places
    [:bottom_places, :upper_places, :side_bottom_places, :side_upper_places, :seats]
      .each.with_object({}) do |place, hsh|
      hsh[place] = public_send(place) unless public_send(place).nil?
    end
  end
end
