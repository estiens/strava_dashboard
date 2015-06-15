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

  def self.build_biker_objects
    array = []
    self.all.each do |biker|
      next if biker.this_week_distance == 0 && biker.last_week_distance == 0
      array.push({ name: biker.name,
        lat_lngs: biker.biker_lat_lngs,
        this_week_distance: biker.this_week_distance,
        last_week_distance: biker.last_week_distance,
        two_week_distance: (biker.this_week_distance + biker.last_week_distance)
      })
    end
    array
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

  def thirty_days_count
    count = 0
    base_date = Time.parse("April 1 2015")
    (0..29).each do |n|
      if self.rides.any? {|ride| ride.datetime > base_date+n.days && ride.datetime < base_date+(n+1).days}
          count += 1
      end
    end
    count
  end

  def self.current
    Biker.where(soft_delete_flag: false)
  end


end
