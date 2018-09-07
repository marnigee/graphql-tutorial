module Types
  class Link < GraphQL::Schema::Object
    description 'Link'

    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
  end
end
