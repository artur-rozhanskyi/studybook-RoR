module SearchService
  class << self
    def find(params)
      Search.call params
    end
  end
end
