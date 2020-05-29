class ChangeColumnNameTypeOnSpells < ActiveRecord::Migration[6.0]
  def change
    rename_column :spells, :type, :kind
  end
end
