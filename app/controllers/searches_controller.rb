class SearchesController < ApplicationController
  def show
    @data = SearchService.find(params)
  end

  private

  def search_params
    params.permit(:starting, :destination)
  end
end
