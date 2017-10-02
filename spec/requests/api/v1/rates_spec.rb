require 'rails_helper'

RSpec.describe "Api::V1::Rates", type: :request do
  let(:base_url) { '/api/v1/rates' }

  describe "GET" do
    let(:expected_id) { rate.id }
    let(:expected_type) { 'rates' }
    let(:expected_count) { 2 }
    before do
      rate
      rate_2
    end

    include_context 'jsonapi GET'

    describe 'attributes' do
      let(:rate) { create :rate, rate: Money.new(100_00, 'EUR'), service_provider: service_provider }

      it 'has a rate attribute that is properly formatted' do
        expect(attributes).to have_key('rate')
        expect(attributes['rate']).to eq '€100.00'
      end

      it 'has a common usd rate' do
        expect(attributes).to have_key('rate-usd')
        expect(attributes['rate-usd']).to eq '$118.12'
      end
    end

    it 'should return all rates if no filter given' do
      expect(data.length).to eq Rate.count
    end

    context 'filter origin and destination' do
      let(:base_url) { super() + "?filter[origin]=#{rate.origin}&filter[destination]=#{rate.destination}" }
      let(:expected_count) { 1 }
      include_context 'jsonapi GET'

      it 'returns only 1 result' do
        expect(Rate.count).to be 2
        expect(data.length).to be expected_count
        expect(data.first['id']).to eq rate.id.to_s
      end
    end
  end
end
