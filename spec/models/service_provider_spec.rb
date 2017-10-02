require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  include_context 'common'

  describe "on create" do
    subject { service_provider }

    it 'automatically sets flat_rate_usd' do
      expect(subject.flat_rate.currency).to eq Money::Currency.new('EUR')
      expect(subject.flat_rate.cents).to eq 15_00
      expect(subject.flat_rate_usd).to eq Money.new(17_72, 'USD')
    end
  end
end
