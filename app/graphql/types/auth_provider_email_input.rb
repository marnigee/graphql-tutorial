module Types
  class AuthProviderEmailInput < GraphQL::Schema::InputObject
    argument :email, String, required: true
    argument :password, String, required: true
  end
end
