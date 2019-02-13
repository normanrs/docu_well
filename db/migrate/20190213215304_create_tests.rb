class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.date :day
      t.string :type
      t.string :notes
      t.references :appointment, foreign_key: true
    end
  end
end
