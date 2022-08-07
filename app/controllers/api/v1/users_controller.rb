module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users, status => 200
      end

      def show
        @user = User.find(params[:id])
        if @user
          render json: @user, status => 200
        else
          render json: { error: 'User not found' }, status => 404
        end
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status => 201
        else
          render json: user.errors, status => 422
        end
      end

      # Put
      def update
        if @user
          render json: @user, status => 200
        else
          render json: @user.errors, status => 422
        end
      end

      # Delete
      def delete
        @user.destroy
        render json: { message: 'User deleted' }, status => 200
      end

      private

      def user_params
        params.permit(:username, :email, :password_digest)
      end

      def user
        @user = User.find(params[:id])
      end
    end
  end
end
