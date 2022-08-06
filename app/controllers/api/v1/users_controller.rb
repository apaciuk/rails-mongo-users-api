module Api
  module V1
    class UsersController < ApplicationController
      def get_users
        users = User.all
        render json: users
      end

      def add_user
        user = User.new(username: params[:username], email: params[:email], password_digest: params[:password_digest])
        if user.save
          render json: user, status => 201
        else
          render json: user.errors, status => 422
        end
      end

      # def user_params
      #  params.require(:user).permit(:username, :email, :password_digest)
      # end
    end
  end
end
