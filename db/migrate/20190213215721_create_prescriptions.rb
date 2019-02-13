class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string :name
      t.date :day
      t.string :dose
      t.string :directions
      t.boolean :refill
      t.references :provider, foreign_key: true
    end
  end
end
