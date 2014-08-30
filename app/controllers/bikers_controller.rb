class BikersController < ApplicationController

  def leaderboard
    @bikers = Biker.all

    respond_to do |format|
      format.json
    end
  end
end
