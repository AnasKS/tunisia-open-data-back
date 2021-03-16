# frozen_string_literal: true

module V1
  # BaseController
  class BaseController < ApplicationController
    attr_reader :current_user

    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    # Extract user and organization from the decoded token.
    def authenticate_user!
      token = decode_authorisation_token

      return unless token

      response = token.first['user']

      @current_user = User.find_by(email: response['email'])
      user = response.slice('email')
      if @current_user
        @current_user.update(user)
      else
        @current_user = User.create! user
      end
    end

    # Request authorization (bearer) token.
    def bearer_token
      pattern = /^Bearer /
      header = request.headers['Authorization']
      header.gsub(pattern, '') if header&.match(pattern)
    end

    # Decodes authorization token. Returns a status message if the token is expired or missing.
    # Decoded message should contain an organization id and a user.
    def decode_authorisation_token
      return missing_token! unless bearer_token

      JWT.decode bearer_token, '', 'HS256'
    rescue JWT::ExpiredSignature
      expired_token!
    rescue JWT::DecodeError
      missing_token!
    end

    # Sets the context with the current user and action (get, post, put, delete) and returns the context.
    def context
      {
        current_user: current_user,
        current_action: action_name,
        params: params
      }
    end

    # Returns if the token was not found or if the decoding did not work.
    def missing_token!
      error_h = {
        title: 'Invalid Token',
        detail: 'Invalid or missing bearer token.',
        code: '401',
        status: '401'
      }

      render json: { errors: [error_h] }, status: :unauthorized
      nil
    end

    # Returns if the bearer/authorization token expired.
    def expired_token!
      error_h = {
        title: 'Expired Token',
        detail: 'Expired Bearer token.',
        code: '401',
        status: '401'
      }

      render json: { errors: [error_h] }, status: :unauthorized
      nil
    end

    # Returns if user is not authorized to perform an action when using API calls.
    def user_not_authorized
      error_h = {
        title: 'Forbidden',
        detail: 'You are not allowed to perform this action.',
        code: '403',
        status: '403'
      }
      render json: { errors: [error_h] }, status: :forbidden
    end

    # Returns if the record cannot be found by the user.
    def record_not_found(err)
      error_h = {
        title: 'Record not found',
        detail: err.to_s,
        code: '404',
        status: '404'
      }
      render json: { errors: [error_h] }, status: 404
    end
  end
end
