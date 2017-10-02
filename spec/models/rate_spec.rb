require 'rails_helper'

RSpec.describe Rate, type: :model do
  include_context 'common'

  it 'belongs_to a service_provider' do
    expect(rate.service_provider).to eq service_provider
  end

  context 'rate is in euros' do
    subject { rate }

    it 'automatically sets rate_usd' do
      expect(subject.rate.currency).to eq Money::Currency.new('EUR')
      expect(subject.rate.cents).to eq 100_00
      expect(subject.rate_usd).to eq Money.new(118_12, 'USD')
    end
  end
end
