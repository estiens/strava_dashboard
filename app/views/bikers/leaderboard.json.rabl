collection @bikers, object_root: false
  attributes :name, :strava_id
  node :this_week_distance do |biker|
    biker.this_week_distance
  end
  node :last_week_distance do |biker|
    biker.last_week_distance
  end
  node :this_week_speed do |biker|
    biker.this_week_speed
  end
  node :last_week_speed do |biker|
    biker.last_week_speed
  end


