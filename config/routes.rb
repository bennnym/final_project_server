Rails.application.routes.draw do
  # resources :employers
  # resources :students

  post '/students/create' => 'students#create'

  post '/employer/create' => 'employer#create'
end
