require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(title: 'Rocketman Gem')
    Product.create!(title: 'Dirtclod Gem')
  end

  test 'listing products' do
    get '/products'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Product.count, json(response.body).size
  end
end
