class CreateInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :insurances do |t|
      t.integer :insurance_type, :limit => 1
      t.string :carrier
      t.string :id_number
      t.string :group_number
      t.string :phone_number
      t.references :profile, foreign_key: true
    end
  end
end
