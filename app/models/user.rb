# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include ActiveModel::SecurePassword
  include BCrypt

  field :name, type: String, default: ''
  field :email, type: String, default: ''
  field :password_digest, type: String, default: ''
  field :admin, type: Boolean, default: false

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 9 }, on: :create

  has_secure_password
end
