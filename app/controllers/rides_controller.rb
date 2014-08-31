class RidesController < ApplicationController

  def index
    @rides = Ride.all
    gon.rides = Biker.all_biker_lat_lngs
  end

  def show
    @ride = Ride.find(params[:id])

    respond_to do |format|
      format.json
    end
  end

end
