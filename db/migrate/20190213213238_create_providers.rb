class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string  :given_name
      t.string  :surname
      t.string  :street_address
      t.string  :city
      t.integer :state, :limit => 1
      t.string  :zip
      t.string  :phone
      t.integer :speciality
    end
  end
end
