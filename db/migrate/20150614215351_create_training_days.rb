class CreateTrainingDays < ActiveRecord::Migration
  def change
    create_table :training_days do |t|
      t.date :date
      t.integer :mileage_high
      t.integer :mileage_low
      t.string :description
      t.integer :actual_mileage
      t.integer :notes_from_run

      t.timestamps
    end
  end
end
