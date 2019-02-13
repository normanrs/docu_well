class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :given_name
      t.string :surname
      t.date :dob
      t.small_int :height
      t.small_int :weight
      t.small_int :bp_systolic
      t.small_int :bp_diastolic
      t.small_int :heart_rate
      t.small_int :blood_type
      t.references :user, foreign_key: true
      t.references :provider, foreign_key: true
    end
  end
end
