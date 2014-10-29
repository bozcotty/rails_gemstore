require 'test_helper'

class CreatingProductsTest < ActionDispatch::IntegrationTest
  test 'create new products with valid data' do
    post '/products', { product: {
      title: 'Moonrock Gem'
      } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)
    assert_equal product_url(product[:id]), response.location

    assert_equal 'Moonrock Gem', product[:title]
  end

  test 'does not create products w invalid data' do
    post '/products', { product: {
      title: nil,
      } }.to_json,
      { 'Accept' => 'application.json',
        'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end
