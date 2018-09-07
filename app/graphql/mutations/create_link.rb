# frozen_string_literal: true

module Mutations
  class CreateLink < GraphQL::Schema::Mutation
    field :description, String, null: true
    field :url, String, null: true
    field :id, String, null: true

    argument :description, ID, required: true
    argument :url, String, required: true

    def resolve(params)
      ::Link.create(description: params[:description], url: params[:url])
    end
  end
end
