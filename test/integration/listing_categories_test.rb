require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    Category.create!(name: 'Dirt Cheap')
    Category.create!(name: 'Da Bling')
  end

  test 'listing categories' do
    get '/categories'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Category.count, json(response.body).size
  end
end
