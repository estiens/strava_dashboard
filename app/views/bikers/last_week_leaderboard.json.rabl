collection @bikers, object_root: false
  attributes :name, :strava_id
  node :distance do |biker|
    biker.last_week_distance
  end
  node :speed do |biker|
    biker.last_week_speed
  end