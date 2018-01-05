class Snack < ApplicationRecord
  has_many :machines_snacks
  has_many :machines, through: :machine_snacks
end
