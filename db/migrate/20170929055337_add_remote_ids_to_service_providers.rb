class AddRemoteIdsToServiceProviders < ActiveRecord::Migration[5.1]
  def change
    add_column :service_providers, :remote_id, :integer
  end
end
