require 'test_helper'

class DeleteProductsTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(title: "Dirt Clod")
  end

  test 'delete products' do
    delete "/products/#{@product.id}"

    assert_equal 204, response.status
  end
end
