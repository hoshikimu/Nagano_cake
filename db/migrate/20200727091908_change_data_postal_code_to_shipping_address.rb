class ChangeDataPostalCodeToShippingAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :shipping_addresses, :postal_code, :string
  end
end