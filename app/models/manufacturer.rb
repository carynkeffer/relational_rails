class Manufacturer < ApplicationRecord
  has_many :discs, dependent: :destroy

  validates_presence_of :name

  def self.order_by_creation
    order(:created_at)
  end

  def disc_count
    discs.length
  end
end
