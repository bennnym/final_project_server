Rails.application.routes.draw do
  post 'employer_token' => 'employer_token#create'
  # resources :employers
  # resources :students

  post '/students/create' => 'students#create'

  post '/employer/create' => 'employer#create'
end
