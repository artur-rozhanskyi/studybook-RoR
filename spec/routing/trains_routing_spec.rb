require 'rails_helper'

RSpec.describe TrainsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/trains').to route_to('trains#index')
    end

    it 'routes to #new' do
      expect(get: '/trains/new').to route_to('trains#new')
    end

    it 'routes to #show' do
      expect(get: '/trains/1').to route_to('trains#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/trains/1/edit').to route_to('trains#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/trains').to route_to('trains#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/trains/1').to route_to('trains#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/trains/1').to route_to('trains#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/trains/1').to route_to('trains#destroy', id: '1')
    end
  end
end
