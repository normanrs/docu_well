class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime   :datetime
      t.references :provider, foreign_key: true
      t.references :profile, foreign_key: true
    end
  end
end
