class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :potency
      t.string :rarity
      t.string :effect
      t.string :benefit

      t.timestamps
    end
  end
end
