# frozen_string_literal: true

module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    class AuthProviderEmailInput < GraphQL::Schema::InputObject
      argument :email, String, required: true
      argument :password, String, required: true
    end

    class AuthProviderInput < GraphQL::Schema::InputObject
      argument :email, AuthProviderEmailInput, required: true
    end

    argument :name, String, required: true
    argument :auth_provider, [AuthProviderInput], required: true

    field :name, String, null: false
    field :email, String, null:false
    field :id, ID, null:false

    def resolve(name:, auth_provider:)
      ::User.create!(
        name: name,
        email: auth_provider.first.email.email,
        password: auth_provider.first.email.password.to_s)
    end
  end
end
