class RemoveProviderFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :provider_id, :bigint
  end
end
