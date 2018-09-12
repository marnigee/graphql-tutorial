# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateUser do
  let(:name) { 'Marni Gee' }
  let(:email) { 'marni_test@gee.com' }
  let(:password) { 'Password!' }

  let!(:query) do
    <<~QUERY
      mutation {
        createUser(
      		name: \"#{name}\",
          authProvider: {email:{email: \"#{email}\", password: \"#{password}\"}
        }
        ) {
          id
          name
          email
        }
      }
    QUERY
  end

  let(:subject) { GraphqlTutorialSchema.execute(query: query) }

  it "creates user" do
    expect { subject }.to change(::User, :count).by(1)
  end

  it "sets email" do
    subject
    expect(User.last.email).to eq('marni_test@gee.com')
  end

  it "sets name" do
    subject
    expect(User.last.name).to eq('Marni Gee')
  end
end
