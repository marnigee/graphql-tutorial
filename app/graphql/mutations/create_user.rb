# frozen_string_literal: true

module Mutations
  class CreateUser < GraphQL::Schema::Mutation
    class AuthProviderInput < GraphQL::Schema::InputObject
      argument :email, Types::AuthProviderEmailInput, required: true
    end

    argument :name, String, required: true
    argument :auth_provider, [AuthProviderInput], required: true

    field :name, String, null: false
    field :email, String, null:false
    field :id, ID, null:false

    def resolve(params)
      ::User.create!(
        name: params[:name],
        email: params[:auth_provider].first.email.email,
        password: params[:auth_provider].first.email.password)
    end
  end
end
