require 'csv'
require 'yaml/store'


current_training_day = nil

store = YAML::Store.new(Rails.root.join("lib/assets/training_plan.store"))
store.transaction do
  store["training_days"] = []

  CSV.foreach(Rails.root.join("lib/assets/plan.csv"), headers: true) do |row|
    row.each do |column|
      if column[0] == "Distance"
        current_training_day = [column[1], column[1]]
      elsif column[0] == "Description"
        current_training_day.append column[1]
        store["training_days"].append(TrainingDayStruct.new(*current_training_day))
        date += 1.day
      end
    end
  end
end
