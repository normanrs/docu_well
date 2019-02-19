class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.string     :name
      t.bigint     :date
      t.integer    :dose
      t.string     :dose_units
      t.string     :directions
      t.boolean    :refill
      t.references :profile, foreign_key: true
      t.references :provider, foreign_key: true
    end
  end
end
