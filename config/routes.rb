Rails.application.routes.draw do
  get '/leaderboard' => 'bikers#leaderboard', :defaults => { :format => 'json' }
  get '/last_week_leaderboard' => 'bikers#last_week_leaderboard', :defaults => { :format => 'json' }
end
