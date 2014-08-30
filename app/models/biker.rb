class Biker < ActiveRecord::Base
  has_many :rides

  def this_week_distance
    self.rides.this_week.sum(:distance).round(2) #miles
  end

  def last_week_distance
    self.rides.last_week.sum(:distance).round(2) #miles
  end

  def this_week_speed
    self.rides.this_week.average(:avg_speed).to_f.round(2)
  end

  def last_week_speed
    self.rides.last_week.average(:avg_speed).to_f.round(2)
  end


end
