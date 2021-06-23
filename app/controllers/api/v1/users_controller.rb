# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def sign_in
        tmp_user = User.new(user_params)
        user = User.find_by(email: tmp_user.email)

        if user&.authenticate(tmp_user.password)
          logged_in user
        else
          render json: { status: 'error', errors: user.errors.messages }
        end
      end

      def sign_up_save
        @user = User.new(user_params)

        if (msg = @user.check_for_errors user_params)
          render json: msg
        else
          render json: @user.save_it
        end
      end

      def logged_in(user)
        session = Session.create(user: user)
        render json: { token: session.token }
      end

      private

      def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
      end
    end
  end
end
