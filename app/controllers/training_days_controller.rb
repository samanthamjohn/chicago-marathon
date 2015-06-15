class TrainingDaysController < ApplicationController

  def index
    # date = Date.today
    date = Date.parse("Oct 1, 2015")
    @training_day = TrainingDay.where("date = ?", date).first
    @training_plan = TrainingPlan.new
    @training_week = @training_plan.training_week_for_date(date)
  end
end
