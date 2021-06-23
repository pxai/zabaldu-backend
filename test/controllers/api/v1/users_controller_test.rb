# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      test 'should sign_in' do
        post api_v1_users_index_url({ user: { email: 'email1', password: 'pass1' } })
        assert_response :success

        data = JSON.parse(@response.body)

        assert_not_nil data['token']
      end

      test 'should return error with wrong password' do
        post api_v1_users_index_url({ user: { email: 'email1', password: 'wrong' } })
        assert_response :success

        data = JSON.parse(@response.body)

        assert_equal data['status'], 'error'
        assert_nil data['token']
      end

      test 'should sign_up' do
        post api_v1_users_sign_up_url({ user: { email: 'email3', name: 'name3', password: 'pass3',
                                                password_confirmation: 'pass3' } })
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['status'], 'ok'
      end

      test 'should fail if user already exists' do
        user = { email: 'email3', name: 'name3', password: 'pass3', password_confirmation: 'pass3' }
        post api_v1_users_sign_up_url({ user: user })
        assert_response :success

        post api_v1_users_sign_up_url({ user: user })
        assert_response :success

        data = JSON.parse(@response.body)

        assert_equal data['status'], 'error'
        assert_equal data['errors'], 'User already exists'
      end

      test 'should fail if fields are missing' do
        post api_v1_users_sign_up_url({ user: { email: 'log', name: '', password: 'pa', password_confirmation: 'pa' } })
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['status'], 'error'
        assert_equal data['errors'], 'Login fields not valid'
      end

      test 'should fail if passwords are different' do
        post api_v1_users_sign_up_url({ user: { email: 'email3', name: 'name3', password: 'pass3',
                                                password_confirmation: 'nope' } })
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['status'], 'error'
        assert_equal data['errors'], 'Passwords must be the same'
      end
    end
  end
end
