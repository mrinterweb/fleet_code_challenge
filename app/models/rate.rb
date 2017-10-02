class Rate < ApplicationRecord
  before_save :set_common_usd
  monetize :rate_cents
  monetize :rate_usd_cents
  belongs_to :service_provider

  private

  def set_common_usd
    self.rate_usd = rate.as_us_dollar
  end
end
