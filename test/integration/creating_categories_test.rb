require 'test_helper'

class CreatingCategoriesTest < ActionDispatch::IntegrationTest
  test 'create new categories with valid data' do
    post '/categories', { category: {
      name: 'Lake Skippers'
      } }.to_json,
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json'}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    category = json(response.body)
    assert_equal category_url(category[:id]), response.location

    assert_equal 'Lake Skippers', category[:name]
  end

  test 'does not create categories w invalid data' do
    post '/categories', { category: {
      title: nil,
      } }.to_json,
      { 'Accept' => 'application.json',
        'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end
