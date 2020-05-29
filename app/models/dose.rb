class Dose < ApplicationRecord
  belongs_to :spell
  belongs_to :ingredient
end
