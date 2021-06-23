# frozen_string_literal: true

class Session < ApplicationRecord
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  belongs_to :user
  before_create :create_token

  def create_token
    self.token = encode
  end

  def self.find_user(token)
    Session.find_by(token: token).user
  end

  def encode(payload = {}, expires = 24.hours.from_now)
    payload[:expires] = expires.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
