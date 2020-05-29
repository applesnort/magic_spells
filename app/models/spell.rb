class Spell < ApplicationRecord
  has_one_attached :photo
  
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  
  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true
  validates :level, presence: true

  def categories
    array = []
    self.all.each { |item| array << item.kind }
    return array.uniq
  end
  
end
