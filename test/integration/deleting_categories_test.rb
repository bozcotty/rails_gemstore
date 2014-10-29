require 'test_helper'

class DeletingCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: "Rubylike")
  end

  test 'delete products' do
    delete "/categories/#{@category.id}"

    assert_equal 204, response.status
  end
