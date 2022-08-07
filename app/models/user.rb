# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include BCrypt

  field :username, type: String, default: ''
  field :email, type: String, default: ''
  field :password_digest, type: String, default: ''

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 9 }, on: :create

  has_secure_password
end
