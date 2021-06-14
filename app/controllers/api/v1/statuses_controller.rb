# frozen_string_literal: true

module Api
  module V1
    class StatusesController < ApplicationController
      def index
        statuses = Status.all()

        render json: { statuses: statuses }
      end

      def show
        status = Status.find(params[:id])

        render json: { status: status }
      end

      private

      def status_params
        params.require(:status).permit(:title, :body)
      end
    end
  end
end
