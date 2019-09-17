class Carriage < ApplicationRecord
  belongs_to :train
  validates :number, uniqueness: { scope: :train_id }

  before_create :set_number

  default_scope { order(:train, :number) }

  protected

  def set_number
    self[:number] = new_carriage_number
  end

  def new_carriage_number 
    carriage_numbers.size.zero? ? 1 : carriage_numbers.max + 1
  end

  def carriage_numbers
    train.carriages.pluck(:number).compact
  end
end
