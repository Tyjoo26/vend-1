class Machine < ApplicationRecord
  belongs_to :owner

  has_many :snacks

  def average_price
    snacks.average(:price)
  end
end
