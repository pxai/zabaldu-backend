# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class StatussControllerTest < ActionDispatch::IntegrationTest
      test 'should return all statuses' do
        get api_v1_statuses_url
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['statuses'].length, 4
      end

      test 'should return one status' do
        get api_v1_statuses_url
        assert_response :success

        data = JSON.parse(@response.body)
        id = data['statuses'][0]['id']


        get api_v1_status_url(id)
        assert_response :success
        single_data = JSON.parse(@response.body)
        assert_equal data['statuses'][0], single_data['status']
      end
    end
  end
end
