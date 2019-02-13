class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.integer :state, :limit => 1
      t.string :zip
      t.string :phone
    end
  end
end
