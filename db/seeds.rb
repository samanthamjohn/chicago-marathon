# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'yaml/store'
TrainingDay.destroy_all

TrainingDayStruct = Struct.new :mileage_low, :mileage_high, :date, :description

store = YAML::Store.new("lib/assets/training_plan.store")
training_plan_data = store.transaction { store["training_days"] }

training_plan_data.each do |training_day|
  TrainingDay.create(date: training_day.date, description: training_day.description, mileage_low: training_day.mileage_low, mileage_high: training_day.mileage_high)
end

