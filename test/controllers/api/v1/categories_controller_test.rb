# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class CategoriesControllerTest < ActionDispatch::IntegrationTest
      test 'should return all categories' do
        get api_v1_categories_url
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['categories'].length, 3
      end

      test 'should return one category' do
        get api_v1_categories_url
        assert_response :success

        data = JSON.parse(@response.body)
        id = data['categories'][0]['id']


        get api_v1_category_url(id)
        assert_response :success
        single_data = JSON.parse(@response.body)
        assert_equal data['categories'][0], single_data['category']
      end
    end
  end
end
