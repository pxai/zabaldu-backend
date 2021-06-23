# frozen_string_literal: true

module Api
  module V1
    class VersionController < ApplicationController
      def index
        render json: {
          name: 'zabaldu',
          env: ENV['RAILS_ENV'],
          build: Rails.application.config.build.chop.to_s
        }
      end
    end
  end
end
