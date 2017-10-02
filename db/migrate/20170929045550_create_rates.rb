class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.monetize :rate, null: false
      t.monetize :rate_usd, currency: { present: false }
      t.string :origin, limit: 2, null: false
      t.string :destination, limit: 2, null: false
      t.belongs_to :service_provider, foreign_key: true

      t.timestamps
    end
  end
end
