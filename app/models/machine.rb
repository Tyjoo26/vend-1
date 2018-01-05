class Machine < ApplicationRecord
  belongs_to :owner

  has_many :snacks
end
