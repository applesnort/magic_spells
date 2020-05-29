if Rails.env.development?
  Dose.destroy_all
  Spell.destroy_all
  Ingredient.destroy_all
end

RARITY = ['common', 'uncommon', 'rare', 'legendary', 'exotic']
SIDE_EFFECTS = ["Constipation",
"Skin rash or dermatitis",
"Diarrhea",
"Dizziness",
"Drowsiness",
"Dry mouth",
"Headache",
"Insomnia",
"Nausea",
"Suicidal thoughts",
"Abnormal heart rhythms",
"Internal bleeding",
"Cancer",
"Fatigue",
"Diarrhea, especially if treatment is for the abdomen. Symptoms tend to appear a few days after the start of treatment and will go away a few weeks later",
"Heart disease, if the site of the tumor is near the heart, for example, in breast cancer treatment",
"Nausea can occur at any time during treatment, or shortly afterward",
"Muscle and joint stiffness",
"Swelling in the affected area",
"Sore skin and skin burns",
"Drop in sex drive and infertility or early menopause, especially if treatment is for the pelvic area",
"Loss of appetite and difficulty swallowing, especially if treatment is aimed at the head, neck, or chest",
"Alopecia, or hair loss, which is normally temporary. Somtimes."]

BENEFITS = ["increased flexibility",
"increased muscle strength and tone",
"improved respiration, energy and vitality",
"maintaining a balanced metabolism",
"weight reduction",
"cardio and circulatory health",
"improved athletic performance",
"protection from injury",
"none"]

7.times do
  c = Spell.create!(
    name: "#{Faker::GreekPhilosophers.name} #{Faker::Construction.subcontract_category} #{Faker::Hipster.sentence(word_count: 3)}",
    kind: Faker::Company.bs,
    level: rand(1..1300).to_i
    )
  rand(2..6).times do 
  i = Ingredient.find_or_create_by(
    name: "#{Faker::Dessert.flavor} #{Faker::Hipster.sentence(word_count: 2)}",
    potency: rand(1..53),
    rarity: RARITY.sample,
    effect: SIDE_EFFECTS.sample(rand(1..8)).join(", "),
    benefit: BENEFITS.sample(rand(1..3)).join(", ")
    )
  d = Dose.create(spell: c, ingredient: i, instructions: "#{Faker::Hipster.sentence(word_count: 2, supplemental: false, random_words_to_add: 2)}")
  end
end
