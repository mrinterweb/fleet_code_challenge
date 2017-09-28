class CreateExchangeRates < ActiveRecord::Migration[5.1]
  def change
    create_table :exchange_rates do |t|
      t.string :currency
      t.string :conversion_currency
      t.float :rate

      t.timestamps
    end
    add_index :exchange_rates, :currency
    add_index :exchange_rates, :conversion_currency
  end
end
