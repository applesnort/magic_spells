require 'open-uri'
require 'json'

if Rails.env.development?
  Dose.destroy_all
  Spell.destroy_all
  Ingredient.destroy_all
end

SPELL_TYPE = []

3.times do |item|
  c = Spell.create!(
    name: "#{Faker::GreekPhilosophers.name} #{Faker::Construction.subcontract_category} #{Faker::Hipster.words(number: 2, supplemental: true)}",
    type: Faker::Company.bs,
    level: rand(1..1300)
    )
  item['ingredients'].each do |ingredient|
  i = Ingredient.find_or_create_by(
    name: "#{Faker::Dessert.flavor} #{Faker::Hipster.words(number: 2, supplemental: true, spaces_allowed: true)}")
  d = Dose.create(spell: c, ingredient: i, description: "#{Faker::Hipster.sentence(word_count: 2, supplemental: false, random_words_to_add: 2)}")
  end
end
