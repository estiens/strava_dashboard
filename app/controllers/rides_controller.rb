class RidesController < ApplicationController

  def index
    @rides = Ride.all
    gon.rides = Biker.all_biker_lat_lngs
  end

end
