# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Version' do
  get '/api/v1/version' do
    example 'Listing version' do
      do_request

      expect(status).to eq 200
    end
  end
end
