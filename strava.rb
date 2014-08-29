require 'logger'
require 'strava/api/v3'
require 'pry'

@client = Strava::Api::V3::Client.new(:access_token => "933e4f09f12e9a568d658ae7baa13e7fdf74b6d3")
binding.pry
activities = @client.list_club_activities(76530)
weekly_activities = activities.select{|activity| Time.parse(activity["start_date_local"]) > Time.now - 60*60*24*7}
