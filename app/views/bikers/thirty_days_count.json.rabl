collection @bikers, object_root: false
  attributes :name, :strava_id
  node :thirty_days_count do |biker|
    biker.thirty_days_count
  end
