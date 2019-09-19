class User < ApplicationRecord
  has_many :tickets, dependent: :nullify, inverse_of: :user
  accepts_nested_attributes_for :tickets
end
