# frozen_string_literal: true

require 'rails_helper'

describe Mutations::CreateLink do
  let!(:url) { 'http://example.com' }
  let!(:description) { 'description' }

  let!(:params) { "url: \"#{url}\", description: \"#{description}\"" }

  let!(:query) do
    <<~QUERY
      mutation {
        createLink(
          #{params}
        ) {
          id
          url
          description
        }
      }
    QUERY
  end

  let(:subject) { GraphqlTutorialSchema.execute(query: query) }

  it "creates link" do
    expect { subject }.to change(::Link, :count).by(1)
  end
end
