class Product < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :shine, :faces, :rarity, :color, presence: true
end
