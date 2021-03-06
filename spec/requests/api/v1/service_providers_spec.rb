require 'rails_helper'

RSpec.describe "Api::V1::ServiceProviders", type: :request do
  include_context 'common'
  let(:base_url) { '/api/v1/service-providers' }

  describe "GET" do
    let(:expected_id) { service_provider.id }
    let(:expected_type) { 'service-providers' }
    let(:expected_count) { 1 }
    include_context 'jsonapi GET'
  end
end
