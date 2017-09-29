class Api::V1::RateResource < JSONAPI::Resource
  attributes :rate, :origin, :destination, :updated_at
  has_one :service_provider

  filters :origin, :destination
end
