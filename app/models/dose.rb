class Dose < ApplicationRecord
  belongs_to :spell
  belongs_to :ingredient
  validates :instructions, presence: true
  validates :ingredient_id, presence: true, uniqueness: { scope: :spell_id } 
end
