Rails.application.routes.draw do
  get '/leaderboard' => 'bikers#leaderboard', :defaults => { :format => 'json' }
  get '/last_week_leaderboard' => 'bikers#last_week_leaderboard', :defaults => { :format => 'json' }
  get '/leaderboard/this_year' => 'bikers#this_year_leaderboard', :defaults => { :format => 'json' }
  get '/' => 'rides#index'
  resources :rides
end
