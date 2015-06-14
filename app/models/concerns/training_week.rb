class TrainingWeek
  attr_accessor :start_date

  def initialize(start_date)
    self.start_date = start_date
  end

  def training_days
    TrainingDay.where("date >= ? AND date < ?", start_date, start_date + 1.week)
  end

  def start_date_string
    self.start_date.strftime("%B %e")

  end

  def mileage_string
    str = mileage_low.to_s
    if mileage_low != mileage_high
      str = mileage_low.to_s + "-" + mileage_high.to_s
    end

    str
  end

  def mileage_low
    training_days.all.reduce(0) {|sum, t| sum += t.mileage_low}
  end

  def mileage_high
    training_days.all.reduce(0) {|sum, t| sum += t.mileage_high}
  end
end
