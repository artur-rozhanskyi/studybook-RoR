require 'rails_helper'

RSpec.describe RailwayStationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/railway_stations').to route_to('railway_stations#index')
    end

    it 'routes to #new' do
      expect(get: '/railway_stations/new').to route_to('railway_stations#new')
    end

    it 'routes to #show' do
      expect(get: '/railway_stations/1').to route_to('railway_stations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/railway_stations/1/edit').to route_to('railway_stations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/railway_stations').to route_to('railway_stations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/railway_stations/1').to route_to('railway_stations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/railway_stations/1').to route_to('railway_stations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/railway_stations/1').to route_to('railway_stations#destroy', id: '1')
    end
  end
end
