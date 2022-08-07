# frozen_string_literal: true

module Api
  module Auth
    class AuthController < ApplicationController
      def login
        user = User.where(name:).first
        return user if user && user.password == password

        nil
      end
    end
  end
end

