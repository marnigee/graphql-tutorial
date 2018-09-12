# frozen_string_literal: true

module Mutations
  class SignInUser < GraphQL::Schema::Mutation
    argument :email, Types::AuthProviderEmailInput, required: true

    field :token, String, null: false
    field :user, Types::User, null: false

    def resolve(params)
      user = ::User.find_by(email: params[:email].email)
      return unless user
      return unless user.authenticate(params[:email].password)

      crypt = ActiveSupport::MessageEncryptor.new(
        Rails.application.secrets.secret_key_base.byteslice(0..31)
      )

      token = crypt.encrypt_and_sign("user-id:#{ user.id }")

      context[:session][:token] = token

      OpenStruct.new(
        user: user,
        token: token
      )
    end
  end
end
