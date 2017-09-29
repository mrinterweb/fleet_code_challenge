RSpec.shared_context 'common' do
  let(:service_provider) { create(:service_provider) }
  let(:rate) { create(:rate, service_provider: service_provider) }
  let(:rate_2) { create :rate, rate: Money.new(500), origin: 'ZZ', destination: 'YY', service_provider: service_provider}
end
