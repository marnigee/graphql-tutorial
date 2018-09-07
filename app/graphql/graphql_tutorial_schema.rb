# frozen_string_literal: true

# GraphqlTutorialSchema = GraphQL::Schema.define do
#   mutation(Types::MutationType)
#   query(Types::QueryType)
# end
class GraphqlTutorialSchema < GraphQL::Schema
  query Types::Query
end
