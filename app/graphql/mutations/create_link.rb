# frozen_string_literal: true

module Mutations
  class CreateLink < GraphQL::Schema::Mutation
    field :description, String, null: true
    field :url, String, null: true
    field :id, String, null: true
    field :user, Types::User, null: false

    argument :description, ID, required: true
    argument :url, String, required: true

    def resolve(params)
      ::Link.create(
        description: params[:description],
        url: params[:url],
        user: context[:current_user]
      )
    end
  end
end
