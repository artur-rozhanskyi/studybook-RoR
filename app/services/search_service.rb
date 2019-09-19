module SearchService
  class << self
    def find_routes(params)
      Search.call params
    end
  end
end
