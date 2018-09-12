# frozen_string_literal: true

require 'rails_helper'

describe Mutations::SignInUser do
  let(:name) { 'Marni Gee' }
  let(:email) { 'marni_test@gee.com' }
  let(:password) { 'Password!' }
  let(:user) {
    User.create!(
      name: name,
      email: email,
      password: password
    )
  }
  let(:params) { "email: \"#{user.email}\", password: \"#{user.password}\"" }

  let(:query) do
    <<~QUERY
      mutation{
        signInUser(
      		email: {
            #{params}
          }
          ) {
            token
            user {
              id
            }
          }
        }
    QUERY
  end

  let(:subject) { GraphqlTutorialSchema.execute(query: query) }

  it "creates a token" do
    result = subject
    token = result['data'].first.second['token']
    id = result['data'].first.second['user']['id'].to_i
    expect(result.present?).to eq(true)
    expect(token.present?).to eq(true)
    expect(id).to eq(user.id)
  end

  it "sets email" do
    subject
    expect(User.last.email).to eq('marni_test@gee.com')
  end

  it "sets name" do
    subject
    expect(User.last.name).to eq('Marni Gee')
  end

  context "without credentials" do
    let(:params) { "email: \"\", password: \"\"" }

    it "returns nil" do
      user = subject['data']['signInUser']
      expect(user).to be_nil
    end
  end

  context "wrong email" do
    let(:params) { "email: \"wrong@email.com\", password: \"\"" }

    it "returns nil" do
      user = subject['data']['signInUser']
      expect(user).to be_nil
    end
  end

  context 'wrong password' do
    let(:params) { "email: \"#{user.email}\", password: \"wrong_password\"" }

    it "returns nil" do
      user = subject['data']['signInUser']
      expect(user).to be_nil
    end
  end

end
