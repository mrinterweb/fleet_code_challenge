require 'rails_helper'

RSpec.describe "Api::V1::Rates", type: :request do
  let(:base_url) { '/api/v1/rates' }

  describe "GET" do
    let(:expected_id) { rate.id }
    let(:expected_type) { 'rates' }
    include_context 'jsonapi GET'

    describe 'attributes' do
      let(:rate) { create :rate, rate: Money.new(100_00, 'EUR'), service_provider: service_provider }

      fit 'has a rate attribute that is properly formatted' do
        expect(attributes).to have_key('rate')
        expect(attributes['rate']).to eq '€100.00'
      end

      it 'has a common usd rate' do
        expect(attributes).to have_key('rate-usd')
        expect(attributes['rate-usd']).to eq '$118.12'
      end
    end

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
