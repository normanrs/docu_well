class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :given_name
      t.string :surname
      t.date :dob
      t.integer :height, :limit => 1
      t.integer :weight, :limit => 1
      t.integer :bp_systolic, :limit => 1
      t.integer :bp_diastolic, :limit => 1
      t.integer :heart_rate, :limit => 1
      t.integer :blood_type, :limit => 1
      t.references :user, foreign_key: true
    end
  end
end
