module SearchesHelper
  def station_list
    @list = RailwayStation.all.collect{|x| [x.name,x.id]}
  end
end
