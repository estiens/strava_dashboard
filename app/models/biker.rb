class Biker < ActiveRecord::Base
  has_many :rides

  def this_week_distance
    self.rides.this_week.sum(:distance).round(2) #miles
  end

  def last_week_distance
    self.rides.last_week.sum(:distance).round(2) #miles
  end

  def this_week_avg_speed
    self.rides.this_week.average(:avg_speed).to_f.round(2)
  end

  def last_week_avg_speed
    self.rides.last_week.average(:avg_speed).to_f.round(2)
  end

  def this_year_distance
    self.rides.this_year.sum(:distance).round(2)
  end

  def this_year_avg_speed
    self.rides.this_year.average(:avg_speed).to_f.round(2)
  end

  def self.all_biker_lat_lngs
    hash = {}
    self.all.each do |biker|
      next if biker.this_week_distance == 0 && biker.last_week_distance == 0
      hash[biker.name] = biker.biker_lat_lngs
    end
    hash
  end

  def biker_lat_lngs
    array = []
    self.rides.this_week.each do |ride|
      hash = Hash.new
      hash[ride.id] = ride.lat_lng_array
      array << hash
    end
    self.rides.last_week.each do |ride|
      hash = Hash.new
      hash[ride.id] = ride.lat_lng_array
      array << hash
    end
    array
  end


end
