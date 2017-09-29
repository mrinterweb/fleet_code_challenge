require 'rails_helper'

RSpec.describe Rate, type: :model do
  include_context 'common'

  it 'belongs_to a service_provider' do
    expect(rate.service_provider).to eq service_provider
  end
end
