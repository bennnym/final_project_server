Rails.application.routes.draw do
  # resources :employers
  # resources :students

  post '/students/create' => 'students#create'
end
