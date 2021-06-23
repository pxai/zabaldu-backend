# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class SignUpTest < ActionDispatch::IntegrationTest
      test 'should signup' do
        post api_v1_users_sign_up_url({ user: { email: 'email3', name: 'name3', password: 'pass3',
                                                password_confirmation: 'pass3' } })
        assert_response :success

        data = JSON.parse(@response.body)
        assert_equal data['status'], 'ok'

        user = User.find_by(email: 'email3')

        assert_equal user.email, 'email3'
      end


      def sign_up_user(name)
        post api_v1_users_sign_up_url({ user: { email: "email1#{name}", name: "name1#{name}", password: "pass1#{name}",
                                                password_confirmation: "pass1#{name}"} })
      end

    end
  end
end
