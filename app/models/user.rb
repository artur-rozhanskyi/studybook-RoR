class User < ApplicationRecord
  has_many :tickets, dependent: :nullify, inverse_of: :user
end
