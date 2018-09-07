# frozen_string_literal: true

require 'rails_helper'

describe GraphQL::Resolvers::CreateLink do
  let(:resolver) { Resolvers::CreateLink.new }
  it 'creates a new link' do
    args = {
      url: 'http://example.com',
      description: 'description'
    }
    link = resolver.call(nil, args, {})

    expect(link.description).to eq('description')
    expect(link.url).to eq('http://example.com')
  end
end
