# # frozen_string_literal: true
#
# Types::QueryType = GraphQL::ObjectType.define do
#   name 'Query'
#   # Add root-level fields here.
#   # They will be entry points for queries on your schema.
#
#   # TODO: remove me
#   field :allLinks, !types[Types::LinkType] do
#     resolve ->(_obj, _args, _ctx) { Link.all }
#   end
# end
