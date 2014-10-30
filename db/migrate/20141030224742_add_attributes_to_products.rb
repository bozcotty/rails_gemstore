class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description, :text
    add_column :products, :shine, :integer
    add_column :products, :faces, :integer
    add_column :products, :rarity, :integer
    add_column :products, :color, :string
  end
end
