class TrainingDaysController < ApplicationController

  def index
    date = Date.today
    @training_day = TrainingDay.where("date = ?", date).first
    @training_plan = TrainingPlan.new
    @training_week = @training_plan.training_week_for_date(date)
  end
end
