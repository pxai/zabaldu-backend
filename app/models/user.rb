# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sessions
  validates_confirmation_of :password
  validates :name, presence: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 3 }, uniqueness: true
  has_secure_password

  def exists?
    User.find_by(email: email) != nil
  end

  def check_for_errors(params)
    return { status: 'error', errors: 'Passwords must be the same' } if password != params['password_confirmation']
    return { status: 'error', errors: 'User already exists' } if exists?
    return { status: 'error', errors: 'Login fields not valid' } unless valid?

    nil
  end

  def save_it
    if save
      { status: 'ok', user: email }
    else
      { status: 'ok', errors: 'Error saving in db' }
    end
  end
end
