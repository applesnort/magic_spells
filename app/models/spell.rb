class Spell < ApplicationRecord
  has_one_attached :photo
  
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  
  validates :name, presence: true, uniqueness: true
  validates :kind, presence: true
  validates :level, presence: true

  def self.categories
    array = []
    self.all.each { |item| array << item.kind }
    return array.uniq
  end

  def self.photo_keyword(spell)
    return spell.ingredients.each {|item| item}.first.benefit.split(' ').sample
  end

  def self.unsplash_photo(spell)
    return Unsplash::Photo.search(spell.kind).first[:urls][:raw]
  end
end
