RSpec.shared_context 'jsonapi common' do
  let(:parsed) { JSON.parse(response.body) }
  let(:data) { parsed['data'] }
end

RSpec.shared_context 'jsonapi GET' do
  include_context 'common'
  include_context 'jsonapi common'

  before do
    service_provider
    rate
  end

  subject! { get base_url }

  it 'returns a 200 status' do
    expect(response.status).to eq 200
  end

  it 'returns expected data' do
    expect(parsed).to have_key('data')
    expect(parsed['data'].length).to be 1
    first = parsed['data'].first
    expect(first['id']).to eq expected_id.to_s
    expect(first['type']).to eq expected_type
  end
end
