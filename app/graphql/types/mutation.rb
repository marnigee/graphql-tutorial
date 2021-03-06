# frozen_string_literal: true

module Types
  class Mutation < GraphQL::Schema::Object
    field :create_link, mutation: Mutations::CreateLink
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
