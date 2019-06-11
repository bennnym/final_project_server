Rails.application.routes.draw do
  post 'student_token' => 'student_token#create'
  post 'employer_token' => 'employer_token#create'

  post '/students/create' => 'students#create'
  post '/student/update' => 'students#update'
  post '/students/bid' => 'students#quickbid'
  get '/students/ending' => 'students#ending'
  get '/students' => 'students#all'
  get 'student/:id' => 'students#profile'
  post '/studentid' => 'students#studentid'


  post '/employer/create' => 'employer#create'
  post '/getid' => 'employer#getid'
  get '/employer/:id' => 'employer#getinfo'

  post '/watchlist/:id' => 'watchlist#toggle'
  get '/watchlist/:id' => 'watchlist#get_watchlists'

  get '/getbids/:id' => 'bid#getbids'
  get '/winningbids/:id' => 'bid#winningbids'


  
end
