class Ingredient < ApplicationRecord
  has_many :doses
  has_many :spells, through: :doses
  validates :name, presence: true, uniqueness: true 
end
