class BikersController < ApplicationController

  def leaderboard
    @bikers = Biker.all.sort_by(&:this_week_distance).reverse.select{|biker| biker.this_week_distance != 0}

    respond_to do |format|
      format.json
    end
  end

  def last_week_leaderboard
    @bikers = Biker.all.sort_by(&:last_week_distance).reverse.select{|biker| biker.last_week_distance != 0}

    respond_to do |format|
      format.json
    end
  end
end
