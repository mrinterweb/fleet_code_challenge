require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  describe "on create" do
    subject { create(:service_provider, flat_rate: Money.new(1500, 'EUR')) }

    it 'automatically sets flat_rate_usd' do
      expect(subject.flat_rate.currency).to eq Money::Currency.new('EUR')
      expect(subject.flat_rate_usd).to eq Money.new(1772, 'USD')
    end
  end
end
