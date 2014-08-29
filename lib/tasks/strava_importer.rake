namespace :import do
  desc "Import Strava Riders"
  task :import_riders => :environment do
    @client = Strava::Api::V3::Client.new(:access_token => "933e4f09f12e9a568d658ae7baa13e7fdf74b6d3")
    riders = @client.list_club_members(76530)
    riders.each do |rider|
      strava_id = rider["id"].to_s
      first_name = rider["firstname"]
      last_name = rider["lastname"]
      full_name = first_name.titlecase + " " + last_name.titlecase

      if Biker.find_by_strava_id(strava_id)
        next
      else
        Biker.create(strava_id: strava_id, name: full_name)
      end
    end
    rides = @client.list_club_activities(76530)
    rides.each do |ride|
      biker = Biker.find_by_strava_id(ride["athlete"]["id"].to_s)
      next if biker.nil?
      strava_id = ride["id"].to_s
      next if Ride.find_by_strava_id(strava_id)
      name = ride["name"]
      distance = ride["distance"] *= 0.000621371
      datetime = ride["start_date_local"].to_datetime
      avg_speed = ride["distance"] / (ride["moving_time"] / 60.0 / 60.0)
      elevation = ride["total_elevation_gain"]
      Ride.create(strava_id: strava_id, biker_id: biker.id, distance: distance, datetime: datetime, avg_speed: avg_speed, elevation: elevation, name: name)
  end
end
end