# frozen_string_literal: true

class GraphqlTutorialSchema < GraphQL::Schema
  query Types::Query
  mutation Types::Mutation
end
