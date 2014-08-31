class Ride < ActiveRecord::Base
  belongs_to :biker
  has_many :waypoints
  after_save :make_polyline_array

  scope :between_dates, ->(begin_date, end_date) {
    where("datetime between ? and ?", begin_date, end_date)
  }

  def self.this_week
    self.between_dates(Time.now.beginning_of_week, Time.now)
  end

  def self.last_week
    self.between_dates((Time.now - 7.days).beginning_of_week, (Time.now-7.days).end_of_week)
  end

  def self.all_polylines
    array =[]
    self.all.each do |ride|
      array << ride.lat_lng_array
    end
    array
  end

  def lat_lng_array
    array = []
    self.waypoints.each do |waypoint|
      array << [waypoint.latitude, waypoint.longitude]
    end
    array
  end

  def make_polyline_array
    polyline = self.polyline
    array = Polylines::Decoder.decode_polyline(polyline)
    array.each do |latlng|
      waypoint = Waypoint.new
      waypoint.latitude = latlng[0]
      waypoint.longitude = latlng[1]
      waypoint.ride_id = self.id
      waypoint.save
    end
  end

  def self.maximum_distance(scope = "all")
    rides = Ride.send(scope)
    max_distance = rides.maximum(:distance)
    Ride.where("distance = ?", max_distance).first
  end

  def self.maximum_speed(scope = "all")
    rides = Ride.send(scope)
    max_speed = rides.maximum(:avg_speed)
    Ride.where("avg_speed = ?", max_speed).first
  end


end