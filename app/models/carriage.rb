class Carriage < ApplicationRecord
  belongs_to :train
  validates :number, uniqueness: { scope: :train_id }
   
  before_validation :set_number

  default_scope { order(:train, :number) }

  protected

  def set_number
    write_attribute(:number, carriage_number )
  end

  def carriage_number    
    train.carriages.present? ? train.carriages.map(&:number).max + 1 : 1
  end
end
