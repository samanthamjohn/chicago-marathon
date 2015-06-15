class TrainingDay < ActiveRecord::Base
  validates :date, uniqueness: true

  def only_mileage_string
    str = mileage_low.to_s
    if mileage_low != mileage_high
      str = mileage_low.to_s + "-" + mileage_high.to_s
    else
      return "Off" if str == "0"
    end

    str
  end

  def mileage_string
    return only_mileage_string if day_off

    only_mileage_string + " miles"  + " " + long_description
  end

  def long_description
    return "" unless description.present?
    description.gsub!(/ml/i, "between 7:30/8:00 min/mile.")

    description.gsub!(/lt/i, "lactate (6:30/7:00 min/mile).") unless description.match(/alternate/i)

    description.gsub!(/mp/i, "marathon pace (7:10 min/mile).")


    if description.match(/\A\d/)
      "with " + description
    else
      description
    end


  end


  def day_off
    only_mileage_string == "Off"
  end

  def today_string
    return "Today is an off day, go to Yoga!" if day_off

    "Today I need to run #{mileage_string.strip}."

  end


end
