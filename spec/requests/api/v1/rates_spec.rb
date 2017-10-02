require 'rails_helper'

RSpec.describe "Api::V1::Rates", type: :request do
  include_context 'common'
  let(:base_url) { '/api/v1/rates' }

  describe "GET" do
    let(:expected_id) { rate.id }
    let(:expected_type) { 'rates' }
    let(:expected_count) { 2 }
    let(:rate) { create :rate, rate: Money.new(2_00, 'EUR'), service_provider: service_provider }
    before do
      rate
      rate_2
    end

    context 'with 3 rates' do
      let!(:rate_3) { create :rate, rate: Money.new(1_00), service_provider: service_provider }

      it 'orders the results by rate-usd' do
        expect(Rate.count).to be 3
        get base_url
        expect(data.length).to be 3
        rate_ids = data.map { |r| r['id'].to_i }
        expect(rate_ids).to eq [rate_3, rate, rate_2].map(&:id)
      end
    end

    include_context 'jsonapi GET'

    describe 'attributes' do

      it 'has a rate attribute that is properly formatted' do
        expect(attributes).to have_key('rate')
        expect(attributes['rate']).to eq '€2.00'
      end

      it 'has a common usd rate' do
        expect(attributes).to have_key('rate-usd')
        expect(attributes['rate-usd']).to eq '$2.36'
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
