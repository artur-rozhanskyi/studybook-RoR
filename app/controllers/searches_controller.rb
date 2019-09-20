class SearchesController < ApplicationController
  def show
    @data = Search.call(params)
  end

  private

  def search_params
    params.permit(:starting, :destination)
  end
end
