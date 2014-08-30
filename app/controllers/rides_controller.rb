class RidesController < ApplicationController

  def index
    @rides = Ride.all
    gon.rides = Ride.all_polylines
  end

end
