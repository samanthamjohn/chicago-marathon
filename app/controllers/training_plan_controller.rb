class TrainingPlanController < ApplicationController
  def index
    @training_plan = TrainingPlan.new
  end
end
