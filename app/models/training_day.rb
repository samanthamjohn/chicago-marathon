class TrainingDay < ActiveRecord::Base
  validates :date, uniqueness: true

  def mileage_string
    str = mileage_low.to_s
    if mileage_low != mileage_high
      str = mileage_low.to_s + "-" + mileage_high.to_s
    end

    return long_description if str == "0"

    str + " miles"  + " " + long_description
  end

  def long_description
    return "" unless description.present?
    description.gsub!(/ml/, "between 7:30/8:00 min/mile.")

    description.gsub!(/lt/i, "lactate (6:30/7:00 min/mile).")

    description.gsub!(/mp/i, "marathon pace (7:10 min/mile).")


    if description.match(/\A\d/)
      "with " + description
    else
      description
    end


  end

end
