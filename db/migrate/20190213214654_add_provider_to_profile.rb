class AddProviderToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profiles, :provider, foreign_key: true
  end
end
