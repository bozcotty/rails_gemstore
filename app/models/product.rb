class Product < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price, presence: true
end
