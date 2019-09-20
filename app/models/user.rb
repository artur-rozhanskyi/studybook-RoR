class User < ApplicationRecord
  has_many :tickets, dependent: :nullify
end
