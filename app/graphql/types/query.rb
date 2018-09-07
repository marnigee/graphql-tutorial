# frozen_string_literal: true
module Types
  class Query < GraphQL::Schema::Object
    description 'The query root of this schema'
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :link, Types::Link, null: true do
      description 'Find a link by ID'
      argument :id, ID, required: true
    end

    field :all_links, [Types::Link], null: false do
      description 'Find all links'
    end

    def link(id:)
      ::Link.find(id)
    end

    def all_links
      ::Link.all
    end
  end
end
