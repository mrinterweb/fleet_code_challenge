class Api::V1::RateResource < JSONAPI::Resource
  attributes :rate, :rate_usd, :origin, :destination, :updated_at
  has_one :service_provider

  filters :origin, :destination

  def rate
    @model.rate.format
  end

  def rate_usd
    @model.rate_usd.format
  end
end
