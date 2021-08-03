class AddLastUpdatedPriceToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :last_updated_price, :date
  end
end
