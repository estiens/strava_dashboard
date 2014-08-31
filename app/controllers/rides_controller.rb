class RidesController < ApplicationController

  def index
    @rides = Ride.all
    @this_week_rides = Ride.this_week
    @last_week_rides = Ride.last_week
    @this_week_longest = Ride.maximum_distance("this_week")
    @last_week_longest = Ride.maximum_distance("last_week")
    @this_week_fastest = Ride.maximum_speed("this_week")
    @last_week_fastest = Ride.maximum_speed("last_week")
    gon.rides = Biker.all_biker_lat_lngs
  end

  def show
    @ride = Ride.find(params[:id])
    respond_to do |format|
      format.json
    end
  end

end
