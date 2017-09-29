require 'rails_helper'

RSpec.describe "Api::V1::Rates", type: :request do
  let(:base_url) { '/api/v1/rates' }

  describe "GET" do
    let(:expected_id) { rate.id }
    let(:expected_type) { 'rates' }
    include_context 'jsonapi GET'

    context 'filter origin and destination' do
      let(:base_url) { super() + "?filter[origin]=#{rate.origin}&filter[destination]=#{rate.destination}" }
      include_context 'jsonapi GET'
      before do
        rate_2
      end

      it 'returns only 1 result' do
        expect(Rate.count).to be 2
        expect(data.length).to be 1
        expect(data.first['id']).to eq rate.id.to_s
      end
    end
  end
end
