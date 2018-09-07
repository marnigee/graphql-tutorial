module Types
  class User < GraphQL::Schema::Object
    description 'User'

    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
  end
end
