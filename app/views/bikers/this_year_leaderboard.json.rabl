collection @bikers, object_root: false
  attributes :name, :strava_id
  node :distance do |biker|
    biker.this_year_distance
  end
  node :speed do |biker|
    biker.this_year_avg_speed
  end