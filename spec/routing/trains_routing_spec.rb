require 'rails_helper'

RSpec.describe Admin::TrainsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/admin/trains').to route_to('admin/trains#index')
    end

    it 'routes to #new' do
      expect(get: '/admin/trains/new').to route_to('admin/trains#new')
    end

    it 'routes to #show' do
      expect(get: '/admin/trains/1').to route_to('admin/trains#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/admin/trains/1/edit').to route_to('admin/trains#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/admin/trains').to route_to('admin/trains#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/admin/trains/1').to route_to('admin/trains#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/admin/trains/1').to route_to('admin/trains#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/admin/trains/1').to route_to('admin/trains#destroy', id: '1')
    end
  end
end
