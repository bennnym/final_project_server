Rails.application.routes.draw do
  post 'student_token' => 'student_token#create'
  post 'employer_token' => 'employer_token#create'

  post '/students/create' => 'students#create'
  get '/students/ending' => 'students#ending'
  get '/students' => 'students#all'

  post '/employer/create' => 'employer#create'
end
