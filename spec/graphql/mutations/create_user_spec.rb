# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateUser do
  let(:name) { 'Marni Gee' }
  let(:auth_provider) do
    Types::AuthProviderEmailInput.new(
      context: nil,
      defaults_used: nil,
      params: {
        email: 'marni@gee1.com',
        password: 'Password!'
      }
    )
  end

  let!(:params) { "name: \"#{name}\", auth_provider: \"#{auth_provider}\"" }

  let!(:query) do
    <<~QUERY
      mutation {
        createUser(
          #{params}
        ) {
          id
          name
          email
        }
      }
    QUERY
  end

  let(:subject) { GraphqlTutorialSchema.execute(query: query) }

  it "creates link" do
    expect { subject }.to change(::User, :count).by(1)
  end
end
