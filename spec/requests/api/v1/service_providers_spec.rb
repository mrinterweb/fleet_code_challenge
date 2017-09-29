require 'rails_helper'

RSpec.describe "Api::V1::ServiceProviders", type: :request do
  let(:base_url) { '/api/v1/service-providers' }

  describe "GET" do
    let(:expected_id) { service_provider.id }
    let(:expected_type) { 'service-providers' }
    include_context 'jsonapi GET'
  end
end
