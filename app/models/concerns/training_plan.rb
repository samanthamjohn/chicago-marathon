class TrainingPlan
  MARATHON_DATE = Date.parse("Nov 1, 2015")

  attr_accessor :training_weeks

  def initialize
    self.training_weeks = []
    num_weeks = 19
    num_weeks.times do |index|
      date = MARATHON_DATE + 1.day - (num_weeks - index).weeks
      self.training_weeks << TrainingWeek.new(date)
    end
  end
end
