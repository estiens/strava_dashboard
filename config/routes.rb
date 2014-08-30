Rails.application.routes.draw do
  get '/leaderboard' => 'bikers#leaderboard', :defaults => { :format => 'json' }
end
