class RidesController < ApplicationController

  def index
    @rides = Ride.all
    @this_week_rides = Ride.this_week
    @last_week_rides = Ride.last_week
    @bikers = Biker.current.sort_by(&:this_week_distance).reverse.select{|biker| biker.this_week_distance != 0}
    gon.bikers = Biker.build_biker_objects
  end

  def show
    @ride = Ride.find(params[:id])
    respond_to do |format|
      format.json
    end
  end

end
